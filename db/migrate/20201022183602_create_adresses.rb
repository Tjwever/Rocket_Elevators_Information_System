class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :adresstype
      t.string :status
      t.string :entity
      t.integer :streetNumber
      t.integer :suite
      t.string :city
      t.string :postalCode
      t.string :country
      t.text :notes

      t.timestamps
    end
  end
end
