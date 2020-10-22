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

ActiveRecord::Schema.define(version: 2020_10_19_230812) do

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "type"
    t.string "status"
    t.date "date_of_commissioning"
    t.date "date_of_last_inspection"
    t.text "certificate_of_operations"
    t.text "information"
    t.text "notes"
    t.bigint "employees_id"
    t.bigint "buildings_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buildings_id"], name: "index_batteries_on_buildings_id"
    t.index ["employees_id"], name: "index_batteries_on_employees_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "information_key"
    t.text "value"
    t.bigint "buildings_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buildings_id"], name: "index_building_details_on_buildings_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "building_address"
    t.string "name_of_building_admin"
    t.string "email_of_building_admin"
    t.integer "phone_of_building_admin"
    t.string "building_tech_contact_name"
    t.string "building_tech_contact_email"
    t.integer "building_tech_contact_phone"
    t.bigint "customers_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_buildings_on_customers_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "type"
    t.integer "nb_of_floor_served"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.bigint "batteries_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batteries_id"], name: "index_columns_on_batteries_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name_of_company"
    t.string "company_hq_address"
    t.string "name_of_company_contact"
    t.integer "company_contact_phone"
    t.string "company_contact_email"
    t.text "company_description"
    t.string "tech_authority_name"
    t.integer "tech_authority_phone"
    t.string "tech_manager_email"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_customers_on_users_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "serial_number"
    t.string "model"
    t.string "type"
    t.string "status"
    t.date "date_of_commissioning"
    t.date "date_of_last_inspection"
    t.text "certificate_of_inspection"
    t.text "information"
    t.text "notes"
    t.bigint "columns_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["columns_id"], name: "index_elevators_on_columns_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "title"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_employees_on_users_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "fullName"
    t.string "companyName"
    t.string "email"
    t.string "phone"
    t.string "projectName"
    t.string "projectDescription"
    t.string "department"
    t.text "subject"
    t.text "message"
    t.binary "attachedFile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.decimal "installationFee", precision: 10
    t.decimal "total", precision: 10
    t.string "elevatorChoice"
    t.integer "nbApparts"
    t.integer "nbFloors"
    t.integer "nbBasements"
    t.integer "nbBusiness"
    t.integer "nbParking"
    t.integer "nbCages"
    t.integer "nbDistinctTenant"
    t.integer "nbOccup"
    t.integer "activity24"
    t.integer "nbElevator"
    t.decimal "unitPrice", precision: 10
    t.decimal "priceElevator", precision: 10
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_quotes_on_users_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "employee_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings", column: "buildings_id"
  add_foreign_key "batteries", "employees", column: "employees_id"
  add_foreign_key "building_details", "buildings", column: "buildings_id"
  add_foreign_key "buildings", "customers", column: "customers_id"
  add_foreign_key "columns", "batteries", column: "batteries_id"
  add_foreign_key "customers", "users", column: "users_id"
  add_foreign_key "elevators", "columns", column: "columns_id"
  add_foreign_key "employees", "users", column: "users_id"
  add_foreign_key "quotes", "users", column: "users_id"
end
