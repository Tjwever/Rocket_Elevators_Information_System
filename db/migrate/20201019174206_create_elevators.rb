class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :serial_number
      t.string :model
      t.string :types
      t.string :status
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.text :certificate_of_inspection
      t.text :information
      t.text :notes
      t.references :column, foreign_key: true
      t.timestamps
    end
  end
end
