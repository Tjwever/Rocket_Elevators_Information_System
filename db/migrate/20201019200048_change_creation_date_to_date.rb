class ChangeCreationDateToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :Customers_Creation_Date, :date
  end
end
