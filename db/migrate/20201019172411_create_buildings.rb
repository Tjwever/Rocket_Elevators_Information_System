class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :building_address_id
      t.string :name_of_building_admin
      t.string :email_of_building_admin
      t.string :phone_of_building_admin
      t.string :building_tech_contact_name
      t.string :building_tech_contact_email
      t.string :building_tech_contact_phone
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
