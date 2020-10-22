class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :types
      t.string :status
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.text :certificate_of_operations
      t.text :information
      t.text :notes
      t.references :employee, foreign_key: true
      t.references :building, foreign_key: true
      t.timestamps
    end
  end
end
