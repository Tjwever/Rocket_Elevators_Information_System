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

ActiveRecord::Schema.define(version: 2020_10_19_200048) do

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "Building_Id"
    t.integer "Employee_Id"
    t.string "Type"
    t.string "Status"
    t.date "Date_Of_Commissioning"
    t.date "Date_Of_Last_Inspection"
    t.text "Certificate_Of_Operations"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "Building_Id"
    t.text "Information_Key"
    t.text "Value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "Customer_Id"
    t.string "Building_Address"
    t.string "Name_Of_Building_Admin"
    t.string "Email_Of_Building_Admin"
    t.integer "Phone_Of_Building_Admin"
    t.string "Building_Tech_Contact_Name"
    t.string "Building_Tech_Contact_Email"
    t.integer "Building_Tech_Contact_Phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "Battery_Id"
    t.string "Type"
    t.integer "Nb_Of_Floor_Served"
    t.string "Status"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "UserId"
    t.date "Customers_Creation_Date"
    t.string "Name_Of_Company"
    t.string "Company_HQ_Address"
    t.string "Name_Of_Company_Contact"
    t.integer "Company_Contact_Phone"
    t.string "Company_Contact_Email"
    t.text "Company_Description"
    t.string "Tech_Authority_Name"
    t.integer "Tech_Authority_Phone"
    t.string "Tech_Manager_Email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "Column_Id"
    t.integer "Serial_Number"
    t.string "Model"
    t.string "Type"
    t.string "Status"
    t.date "Date_Of_Commissioning"
    t.date "Date_Of_Last_Inspection"
    t.text "Certificate_Of_Inspection"
    t.text "Information"
    t.text "Notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "FirstName"
    t.string "LastName"
    t.string "Title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "fullName"
    t.string "companyName"
    t.string "email"
    t.string "phone"
    t.string "projectName"
    t.string "projectDescription"
    t.string "department"
    t.string "message"
    t.binary "attachedFile"
    t.string "contracRequestDate"
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "totalCost"
    t.integer "InstallationFee"
    t.integer "Total"
    t.integer "TotalNBofElevator"
    t.string "ElevatorChoice"
    t.integer "NbApparts"
    t.integer "NbFloors"
    t.integer "NbBasements"
    t.integer "NbBusiness"
    t.integer "NbParking"
    t.integer "NbCages"
    t.integer "NbDistinctTenant"
    t.integer "nbOccup"
    t.integer "Activity24"
    t.integer "NbElevator"
    t.integer "UnitPrice"
    t.integer "PriceElevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "superadmin_role", default: false
    t.boolean "employee_role", default: false
    t.boolean "user_role", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
