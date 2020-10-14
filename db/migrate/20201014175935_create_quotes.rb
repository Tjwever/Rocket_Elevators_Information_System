class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :totalCost
      t.integer :InstallationFee
      t.integer :Total
      t.integer :TotalNBofElevator
      t.string :ElevatorChoice
      t.integer :NbApparts
      t.integer :NbFloors
      t.integer :NbBasements
      t.integer :NbBusiness
      t.integer :NbParking
      t.integer :NbCages
      t.integer :NbDistinctTenant
      t.integer :nbOccup
      t.integer :Activity24
      t.integer :NbElevator
      t.integer :UnitPrice
      t.integer :PriceElevator

      t.timestamps
    end
  end
end
