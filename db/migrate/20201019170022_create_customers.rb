class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name_of_company
      t.integer :company_hq_address_id
      t.string :name_of_company_contact
      t.string :company_contact_phone
      t.string :company_contact_email
      t.text :company_description
      t.string :tech_authority_name
      t.string :tech_authority_phone
      t.string :tech_manager_email
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
