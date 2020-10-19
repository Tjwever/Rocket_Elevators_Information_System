class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :Battery_Id
      t.string :Type
      t.integer :Nb_Of_Floor_Served
      t.string :Status
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
