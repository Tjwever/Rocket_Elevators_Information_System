class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :Column_Id
      t.integer :Serial_Number
      t.string :Model
      t.string :Type
      t.string :Status
      t.date :Date_Of_Commissioning
      t.date :Date_Of_Last_Inspection
      t.text :Certificate_Of_Inspection
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
