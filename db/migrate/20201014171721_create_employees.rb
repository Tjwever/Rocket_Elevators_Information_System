class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstName
      t.string :lastName
      t.string :title
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
