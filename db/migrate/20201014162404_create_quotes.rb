class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :totalCost
      t.integer :InstallationFee

      t.integer :Total
      t.integer :NumbelevatorTotal
      t.string :choiceElevator

      t.integer :nbApparts
      t.integer :nbFloors
      t.integer :nbBasement

      t.integer :nbBusiness
      t.integer :nbParking
      t.integer :nbCages

      t.integer :nbDistinctTenant
      t.integer :nbOccup
      t.integer :activity24

      t.integer :nbElevator
      t.integer :totalCost
     
    
      t.integer :unitPrice
      t.integer :priceElevator
    

      t.timestamps
    end
  end
end
