class TransferDataController < ApplicationController
    def transfer
        puts "Hello world"
        sync_fact_quotes()
    end

    def sync_fact_quotes
        puts "METHOD CALLED"

        conn = PG::Connection.open(host: 'localhost', dbname: 'data_storage', user: 'postgres', password: 'admin')
        puts "Connected to database #{conn.db} as #{conn.user} with password #{conn.pass}"

        for quote in Quote.all do
            puts quote
        #   user = User.find(quote.user_id)
        #   customer = Customer.find(user.id)
        #   puts user
        #   puts quote
        #   puts customer
        #   FactQuote.create!({
            # quote_id: quote.id,
        #     quote_created_at: quote.created_at,
        #     company_name: customer.name_of_company,
        #     email: user.email,
        #     nbElevator: quote.nbElevator
        #   })
        end
    end
end