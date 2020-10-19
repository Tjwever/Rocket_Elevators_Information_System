class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :Customer_Id
      t.string :Building_Address
      t.string :Name_Of_Building_Admin
      t.string :Email_Of_Building_Admin
      t.integer :Phone_Of_Building_Admin
      t.string :Building_Tech_Contact_Name
      t.string :Building_Tech_Contact_Email
      t.integer :Building_Tech_Contact_Phone

      t.timestamps
    end
  end
end
