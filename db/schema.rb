# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations


ActiveRecord::Schema.define(version: 2020_10_22_183602) do

  create_table "adresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "type"
    t.string "status"
    t.string "entity"
    t.integer "streetNumber"
    t.integer "suite"
    t.string "city"
    t.string "postalCode"
    t.string "country"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "types"
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

  create_table "blazer_audits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
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
    t.string "types"
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
    t.string "types"
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
