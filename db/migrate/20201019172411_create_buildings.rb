class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :building_address
      t.string :name_of_building_admin
      t.string :email_of_building_admin
      t.integer :phone_of_building_admin
      t.string :building_tech_contact_name
      t.string :building_tech_contact_email
      t.integer :building_tech_contact_phone
      t.references :customers, foreign_key: true
      t.timestamps
    end
  end
end
