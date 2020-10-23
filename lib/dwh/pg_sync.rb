module Dwh
    class Sync
  
      def self.sync_fact_quotes
        for quote in Quote.all do
          user = User.find(quote.user_id)
          customer = Customer.find(user.id)
          FactQuote.create!({
            quote_id: quote.id,
            quote_created_at: quote.created_at,
            company_name: customer.name_of_company,
            email: user.email,
            nbElevator: quote.nbElevator
            })
        end
      end
      
      
      def self.sync_fact_elevators
          for elevator in Elevator.all do
          column = Column.find(elevator.column_id)
          battery = Battery.find(column.id)
          building = Building.find(battery.id)
          address = Address.find(building.id)
          customer = Customer.find(building.id)
      
      
          FactElevator.create!({
              serial_number: elevator.serial_number,
              date_of_commissioning: elevator.date_of_commissioning,
              building_id: building.id,
              customer_id: customer.id,
              building_city: address.city
              })
          end
          end
      
      
          def self.sync_fact_contacts 
          for user in User.all do
              customer = Customer.find(user.id)
              lead = Lead.find(user.id)
              FactContact.create!({ 
              contact_id: user.id,
              creation_date: user.created_at,
              company_name: customer.name_of_company,
              email: user.email,
              project_name: lead.projectName
              })
      
          end
          end
      
      
          def self.sync_dim_customers
          for customer in Customer.all do
              nbElevator = 0
              customer_buildings = Building.where(customer_id: customer.id).to_a
              for building in customer_buildings do
              batteries = Battery.where(building_id: building.id).to_a
              for battery in batteries do
                  columns = Column.where(battery_id: battery.id).to_a
                  for column in columns do
                  elevators = Elevator.where(column_id: column.id).to_a
                  nbElevator += elevators.size
                  end
              end
              end
              city = Address.find(customer.company_hq_address).city
              DimCustomer.create!({
              customer_creation_date: customer.created_at,
              company_name: customer.name_of_company,
              company_contact_full_name: customer.name_of_company_contact,
              company_contact_email: customer.company_contact_email,
              nbElevator: nbElevator,
              customer_city: city
              })
          end
          end
              
              
    end
  end