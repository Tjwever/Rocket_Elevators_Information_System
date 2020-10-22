class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.decimal :installationFee
      t.decimal :total
      t.string :elevatorChoice
      t.integer :nbApparts
      t.integer :nbFloors
      t.integer :nbBasements
      t.integer :nbBusiness
      t.integer :nbParking
      t.integer :nbCages
      t.integer :nbDistinctTenant
      t.integer :nbOccup
      t.integer :activity24
      t.integer :nbElevator
      t.decimal :unitPrice
      t.decimal :priceElevator
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
