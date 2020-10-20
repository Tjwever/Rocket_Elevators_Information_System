# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_20_082213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimcustomers", force: :cascade do |t|
    t.datetime "creation"
    t.string "companyname", default: "", null: false
    t.string "companyfullname", default: "", null: false
    t.string "companyemail", default: "", null: false
    t.integer "nbelevators", default: 0, null: false
    t.string "customercity", default: "", null: false
  end

  create_table "factcontact", force: :cascade do |t|
    t.integer "contactid", default: 0, null: false
    t.datetime "creation"
    t.string "companyname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "projectname", default: "", null: false
  end

  create_table "factelevator", force: :cascade do |t|
    t.string "serialnumber", default: "", null: false
    t.datetime "datecommissioning", null: false
    t.bigint "buildingid", default: 0, null: false
    t.bigint "customerid", default: 0, null: false
    t.string "buildingcity", default: "", null: false
  end

  create_table "factquotes", force: :cascade do |t|
    t.integer "quoteid", default: 0, null: false
    t.datetime "creation"
    t.string "companyname", default: "", null: false
    t.string "email", default: "", null: false
    t.integer "nbelevator", default: 0, null: false
  end

end
