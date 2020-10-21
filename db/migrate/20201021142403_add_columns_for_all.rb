class AddColumnsForAll < ActiveRecord::Migration[5.2]
  def change
    # add_column :posts, :user_id, :integer
    # batteries
    add_index :batteries, :Building_Id
    add_index :batteries, :Employee_Id
    # building_details
    add_column :building_details, :user_id, :integer
    add_index :building_details, :Building_Id
    add_index :building_details, :user_id
    # buildings
    add_column :buildings, :user_id, :integer
    add_column :buildings, :adress_id, :integer
    add_index :buildings, :user_id
    add_index :buildings, :Customer_Id
    add_index :buildings, :adress_id
    # columns
    add_index :columns, :Battery_Id
    # customers
    add_column :customers, :adress_id, :integer
    add_index :customers, :UserId
    add_index :customers, :adress_id
    # elevators
    add_index :elevators, :Column_Id
    # employees
    add_column :employees, :user_id, :integer
    add_index :employees, :user_id
    # quotes
    add_column :quotes, :user_id, :integer
    add_index :quotes, :user_id
    

  end
end
