class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstName
      t.string :lastName
      t.string :title

      t.timestamps
    end
  end
end
