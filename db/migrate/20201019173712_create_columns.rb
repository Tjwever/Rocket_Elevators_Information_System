class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :types
      t.integer :nb_of_floor_served
      t.string :status
      t.text :information
      t.text :notes
      t.references :battery, foreign_key: true
      t.timestamps
    end
  end
end
