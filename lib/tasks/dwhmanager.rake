task spec: ["dwhmanager:db:test:prepare"]

namespace :dwhmanager do

# Task to manage transfert data from database to datawarehouse 
require 'pg'

  task transfert: :environment do
    conn = PG::Connection.open(host: 'codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com', dbname: 'data_storage', user: 'codeboxx', password: 'Codeboxx1!')
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
          # puts "INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{user_tmp.name_of_company}', '#{user_tmp.company_contact_email}', #{q.nbElevator})"
          conn.exec("INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{user_tmp.name_of_company}', '#{user_tmp.company_contact_email}', #{q.nbElevator})")
        end   
      end 

      # FACT CONTACT
      Lead.all.each do |l|
        # puts "INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES (#{l.id}, '#{l.created_at}', '#{l.companyName}', '#{l.email}', #{l.projectName})"
        conn.prepare("factcontact", "INSERT INTO factcontact (contactid, creation, companyname, email, projectname) VALUES ($1, $2, $3, $4, $5)")
        conn.exec_prepared("factcontact", [l.id, l.created_at, l.companyName, l.email, l.projectName])
        conn.exec("DEALLOCATE factcontact")
        
        #{l.id}, '#{l.created_at}', #{ActiveRecord::Base.connection.quote(l.companyName)}, '#{l.email}', '#{l.projectName}')"

      end

      # FACT ELEVATOR
    Elevator.all.each do |e|
        buildingAddressId = e.column.battery.building.building_address_id
        address = Adress.find(buildingAddressId)
        # puts "INSERT INTO factelevator (serialnumber, datecommissioning, buildingid, customerid, buildingcity) VALUES ('#{e.serial_number}', '#{e.date_of_commissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{address.city}')"
        conn.exec("INSERT INTO factelevator (serialnumber, datecommissioning, buildingid, customerid, buildingcity) VALUES ('#{e.serial_number}', '#{e.date_of_commissioning}', '#{e.column.battery.building.id}', '#{e.column.battery.building.customer.id}', '#{address.city}')")
    end

    # DIM CUSTOMERS
    Customer.all.each do |c|
      # puts "c id #{c.id}"
      totalElevators = 0
      # puts "nb of buildings #{c.building.length()}" 
      c.building.each do |bld|
        # puts "nb of batteries #{bld.battery.length()}"
        bld.battery.each do |btt|
          # puts "nb of columns #{btt.column.length()}"
          btt.column.each do |col|
            # puts "nb of elevators #{col.elevator.length()}"
            totalElevators += col.elevator.length()
            # puts totalElevators
          end
        end
      end
      # changer le nom (avec foregn key)
      buildingAddressId = c.company_hq_address_id
      address = Adress.find(buildingAddressId)

      conn.exec("INSERT INTO dimcustomers (companyname, companyfullname, companyemail, nbelevators, customercity, creation) VALUES ('#{c.name_of_company}', '#{c.name_of_company_contact}', '#{c.company_contact_email}', #{totalElevators},'#{address.city}', '#{c.created_at}')")
    end

  end
  task emptest: :environment do
    # Employee.create!(user: User.create!(email: 'nicolas.genest@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0), firstName: 'Nicolas', lastName: 'Genest', title: "CEO")
    # Employee.create!(, firstName: 'Nicolas', lastName: 'Genest', title: "CEO")
  end

  task cleardwh: :environment do 
    conn = PG::Connection.open(host: 'localhost', dbname: 'data_storage', user: 'postgres', password: 'admin')
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