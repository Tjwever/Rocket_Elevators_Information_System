class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :UserId
      t.integer :Customers_Creation_Date
      t.string :Name_Of_Company
      t.string :Company_HQ_Address
      t.string :Name_Of_Company_Contact
      t.integer :Company_Contact_Phone
      t.string :Company_Contact_Email
      t.text :Company_Description
      t.string :Tech_Authority_Name
      t.integer :Tech_Authority_Phone
      t.string :Tech_Manager_Email

      t.timestamps
    end
  end
end
