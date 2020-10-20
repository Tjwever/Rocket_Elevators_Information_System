class DimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dimcustomers do |t|
      t.datetime "creation"
      t.string "companyname", default: "", null: false
      t.string "companyfullname", default: "", null: false
      t.string "companyemail", default: "", null: false
      t.integer "nbelevators", default: 0, null: false
      t.string "customercity", default: "", null: false
      end
  end
end
