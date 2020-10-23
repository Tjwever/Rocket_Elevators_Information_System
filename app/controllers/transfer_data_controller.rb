class TransferDataController < ApplicationController
    def transfer
        puts "Hello world"
        sync_fact_quotes()
    end

    def sync_fact_quotes
        puts "METHOD CALLED"

        conn = PG::Connection.open(host: 'localhost', dbname: 'data_storage', user: 'postgres', password: 'admin')
        puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

       
    end
end