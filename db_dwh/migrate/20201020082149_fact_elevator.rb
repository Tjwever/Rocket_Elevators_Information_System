class FactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :factelevator do |t|
      t.string "serialnumber", default: "", null: false
      t.datetime "datecommissioning", default: "", null: false
      t.bigint "buildingid", default: 0, null: false
      t.bigint "customerid", default: 0, null: false
      t.string "buildingcity", default: "", null: false
    end
  end
end
