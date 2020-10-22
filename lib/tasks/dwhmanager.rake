task spec: ["dwhmanager:db:test:prepare"]

namespace :dwhmanager do

#   task fake: :environment do

#     # Generate fake quotes
#     300.times do
#       Quote.create([{

#         installationFee: Faker::Number.between(from: 10000, to: 50000),
#         total: Faker::Number.between(from: 10000, to: 50000),
#         elevatorChoice: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
#         nbApparts: Faker::Number.between(from: 30, to: 300),
#         nbFloors: Faker::Number.between(from: 5, to: 50),
#         nbBasements: Faker::Number.between(from: 1, to: 5),
#         nbBusiness: Faker::Number.between(from: 1, to: 20),
#         nbParking: Faker::Number.between(from: 10, to: 70),       
#         nbCages: Faker::Number.between(from: 1, to: 10),
#         nbDistinctTenant: Faker::Number.between(from: 1, to: 5),
#         nbOccup: Faker::Number.between(from: 20, to: 100),
#         activity24: Faker::Number.between(from: 1, to: 24),
#         nbElevator: Faker::Number.between(from: 1, to: 10),
#         unitPrice: Faker::Number.between(from: 1000, to: 5000),
        
#       }])
#     end
#     # Generate fake Adresses
#     50.times do
#       Adress.create([{
#         type: ["Businesss", "Shipping", "Home"].sample,
#         status: [:Active, :Inactive].sample,
#         entity: [:Building, :Customer].sample,
#         streetNumber: Faker::Address.unique.secondary_address,
#         suite: Faker::Number.unique.number(digits: 4),
#         city: Faker::Address.city_prefix,
#         postalCode: Faker::Address.unique.postcode,
#         country: [:US, :CA].sample,
#         # notes: ""
#       }])
#     end
  
#     #   Generate fake building
#     100.times do 
#       Building.create([{       

#         building_address: Faker::Name.name,
#         name_of_building_admin: Faker::Name.name,
#         email_of_building_admin: Faker::Internet.email,
#         phone_of_building_admin: Faker::PhoneNumber.phone_number,
#         building_tech_contact_name: Faker::Artist.name,
#         building_tech_contact_email: Faker::Internet.email,
#         building_tech_contact_phone: Faker::PhoneNumber.phone_number,
#         customers_id: Faker::Number.between(from: 1, to: 100),
#       }])
#     end
#     # Generate fake battery
#     200.times do 
#       Battery.create([{
#         types: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
#         status: ["Active", "Maintenance", "Inactive"].sample,
#         date_of_commissioning: Faker::Date.between(from: 1000.days.ago, to: Date.today),
#         date_of_last_inspection: Faker::Date.between(from: 1000.days.ago, to: Date.today),
#         certificate_of_operations: Faker::IndustrySegments.industry,
#         information: Faker::IndustrySegments.industry,  
#         notes: Faker::IndustrySegments.industry, 
#         employees_id:  Faker::Number.between(from: 1, to: 100), 
       
        
#       }])
#     end

#  #   Generate fake column
#  300.times do 
#   Column.create([{
#     types: ["Residential", "Commercial", "Corporate", "Hybrid"].sample,
#     nb_of_floor_served: Faker::Number.between(from: 1, to: 70),
#     status: ["Active", "Maintenance", "Inactive"].sample,
#     information: Faker::IndustrySegments.industry,
#     notes: Faker::IndustrySegments.industry,
#     batteries_id:  Faker::Number.between(from: 1, to: 100),
#   }])
# end
# end

# Task to manage transfert data from database to datawarehouse 
require 'pg'

task transfert: :environment do
  conn = PG::Connection.open(host: 'localhost', dbname: 'data_storage', user: 'postgres', password: 'SimpleRed')
  puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"


   # FACT ELEVATOR
   Elevator.all.each do |e|
    puts "INSERT INTO factelevator (serialnumber, commissioningdate, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.date_of_commissioning}', '#{e.columns.batteries.buildings.id}', '#{e.columns.batteries.buildings.customers.id}', '#{e.columns.batteries.buildings.building_address}')"
    conn.exec("INSERT INTO factelevator (serialnumber, commissioningdate, buildingid, customerid, buildingcity) VALUES (#{e.serial_number}, '#{e.date_of_commissioning}', '#{e.columns.batteries.buildings.id}', '#{e.columns.batteries.buildings.customers.id}', '#{e.columns.batteries.buildings.building_address}')")
  end



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
# remarque joey de s est ce que ca fait partie de cammande 
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

    # set config variables for custom database
    # ENV['SCHEMA'] = "db/schema.rb"
    # Rails.application.config.paths['db']
    # Rails.application.config.paths['db/migrate']
    # Rails.application.config.paths['db/migrate/status']
    # Rails.application.config.paths['db/seeds']
    # Rails.application.config.paths['config/database']

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