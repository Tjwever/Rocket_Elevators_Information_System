task spec: ["dwhmanager:db:test:prepare"]

namespace :dwhmanager do

# Task to manage transfert data from database to datawarehouse 
require 'pg'

  task transfert: :environment do
  conn = PG::Connection.open(host: 'localhost', dbname: 'data_storage', user: 'postgres', password: 'SimpleRed')
  puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

  

  conn.exec("TRUNCATE TABLE dimcustomers RESTART IDENTITY;")
  conn.exec("TRUNCATE TABLE factquotes RESTART IDENTITY;")
  conn.exec("TRUNCATE TABLE factcontact RESTART IDENTITY;")
  conn.exec("TRUNCATE TABLE factelevator RESTART IDENTITY;")
  puts "Cleared table"

  # FACT QUOTES
  Quote.all.each do |q|
      user_tmp = Customer.where(id: q.id).first
      if user_tmp 
        puts "INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{user_tmp.name_of_company}', '#{user_tmp.company_contact_email}', #{q.nbElevator})"
      
        conn.exec("INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{user_tmp.name_of_company}', '#{user_tmp.company_contact_email}', #{q.nbElevator})")
    
      end    

    end 
    # FACT CONTACT
    Lead.all.each do |l|
      puts "INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES (#{l.id}, '#{l.created_at}', '#{l.companyName}', '#{l.email}', #{l.projectName})"

      conn.exec("INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES (#{l.id}, '#{l.created_at}', '#{l.companyName}', '#{l.email}', '#{l.projectName}')")
    end

     # FACT ELEVATOR
     Elevator.all.each do |e|
      puts "INSERT INTO factelevator (serialnumber, datecommissioning, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.date_of_commissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.building_address}')"
      conn.exec("INSERT INTO factelevator (serialnumber, datecommissioning, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.date_of_commissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{e.column.battery.building.building_address}')")
    end
# DIMENSION CUSTOMERS
    Customer.all.each do |a|
      nbelevators = 0
      a.building.all.each do |b|
          b.battery.all.each do |c|
              c.column.all.each do |d|
                nbelevators += d.elevator.count
              end
          end

      end
      puts "INSERT INTO dimcustomers (creation, companyname, companyfullname, companyemail, nbelevators, customercity) VALUES ('#{a.created_at}', '#{a.name_of_company}', '#{a.name_of_company_contact}', '#{a.company_contact_email}', #{nbelevators}, '#{a.company_hq_address}')"
      conn.exec("INSERT INTO dimcustomers (creation, companyname, companyfullname, companyemail, nbelevators, customercity) VALUES ('#{a.created_at}', '#{a.name_of_company}', '#{a.name_of_company_contact}', '#{a.company_contact_email}', #{nbelevators}, '#{a.company_hq_address}')")
  end

  end

  task cleardwh: :environment do 
    conn = PG::Connection.open(host: 'localhost', dbname: 'data_storage', user: 'postgres', password: 'SimpleRed')
  puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

    conn.exec("TRUNCATE TABLE dimcustomers RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factquotes RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factcontact RESTART IDENTITY;")
    conn.exec("TRUNCATE TABLE factelevator RESTART IDENTITY;")
    puts "Cleared table"
  end
  
  # db tasks

  namespace :db do |ns|

  task :drop do
  Rake::Task["db:drop"].invoke
  end

  task :create do
  Rake::Task["db:create"].invoke
  end

  task :setup do
  Rake::Task["db:setup"].invoke
  end

  task :migrate do
  Rake::Task["db:migrate"].invoke
  end

  task :status do
  Rake::Task["db:migrate:status"].invoke
  end

  task :rollback do
  Rake::Task["db:rollback"].invoke
  end

  task :seed do
  Rake::Task["db:seed"].invoke
  end

  task :version do
  Rake::Task["db:version"].invoke
  end

  namespace :schema do
  task :load do
  Rake::Task["db:schema:load"].invoke
  end

  task :dump do
  Rake::Task["db:schema:dump"].invoke
  end
  end

  namespace :test do
  task :prepare do
  Rake::Task["db:test:prepare"].invoke
  end
  end

  # append and prepend proper tasks to all the tasks defined here above
  ns.tasks.each do |task|
  task.enhance ["dwhmanager:set_custom_config"] do
  Rake::Task["dwhmanager:revert_to_original_config"].invoke
  end
  end
  end

  task :set_custom_config do
  # save current vars
  @original_config = {
  env_schema: ENV['SCHEMA'],
  config: Rails.application.config.dup
  }


  ENV['SCHEMA'] = "db/db_dwh/schema.rb"
  Rails.application.config.paths['db'] = ["db/db_dwh"]
  Rails.application.config.paths['db/migrate'] = ["db_dwh/migrate"]
  Rails.application.config.paths['db/migrate/status'] = ["db_dwh/migrate/status"]
  Rails.application.config.paths['db/seeds'] = ["db_dwh/seeds.rb"]
  Rails.application.config.paths['config/database'] = ["config/dwh_database.yml"]
  end

  task :revert_to_original_config do
  # reset config variables to original values
  ENV['SCHEMA'] = @original_config[:env_schema]
  Rails.application.config = @original_config[:config]
  end
end