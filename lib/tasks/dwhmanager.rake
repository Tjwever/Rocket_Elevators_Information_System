task spec: ["dwhmanager:db:test:prepare"]

namespace :dwhmanager do

# Task to manage transfert data from database to datawarehouse 
require 'pg'

task transfert: :environment do
  conn = PG::Connection.open(host: 'localhost', dbname: 'data_storage', user: 'postgres', password: 'SimpleRed')
  puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"


  # FACT QUOTES
  Quote.all.each do |q|
    user_tmp = User.where(id: q.id).first
    puts "INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', #{user_tmp.company}, #{user_tmp.email}, #{q.NbElevator})"
    
    conn.exec("INSERT INTO factquotes (quoteid, creation, companyname, email, nbelevator) VALUES (#{q.id}, '#{q.created_at}', '#{user_tmp.company}', '#{user_tmp.email}', #{q.NbElevator})")
   
    end
  
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