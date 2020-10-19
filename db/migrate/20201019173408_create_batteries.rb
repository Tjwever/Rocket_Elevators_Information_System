class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.integer :Building_Id
      t.integer :Employee_Id
      t.string :Type
      t.string :Status
      t.date :Date_Of_Commissioning
      t.date :Date_Of_Last_Inspection
      t.text :Certificate_Of_Operations
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
