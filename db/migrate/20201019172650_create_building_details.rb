class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.integer :Building_Id
      t.text :Information_Key
      t.text :Value

      t.timestamps
    end
  end
end
