require 'csv'
require "faker"

CSV.foreach(Rails.root.join('address.csv'), headers: true) do |row|
    puts row.inspect
end

random_type = ["Residential", "Commercial", "Corporate"]
random_status = ["Active", "Inactive"]

52.times do
    Leads.create(
        fullName: Fakker::Name.name
        companyName: Fakker::Company.name
        email: Fakker::Internet.safe_email
        phone: Fakker::PhoneNumber.cell_phone
        projectName: Fakker::Space.star
        projectDescription: Fakker::Company.catch_phrase
        department: Fakker::
        subject: Fakker::sentence
        message: Fakker::Lorem.paragraphs
    )
end




15.times do
    Customers.create(
        UserId:
        Customers_creation_date: Fakker::Date.between(from: '2017-09-23', to: '2020-09-25')
        Name_of_company: Fakker::Company.name
        Compagny_hq_address: Fakker::
        Name_of_company_contact: Fakker::Name.name
        Company_contact_phone: Fakker::PhoneNumber.cell_phone
        Company_contact_email: Fakker::Internet.safe_email
        Company_Description: Fakker::Company.buzzword
        Tech_Authority_Name: Fakker::Name.name
        Tech_Authority_Phone: Fakker::PhoneNumber.cell_phone
        Tech_Manager_Email: Fakker::Internet.safe_email
    )
end

20.times do
    Building.create(
        Customer_Id:
        Building_Address: Fakker::
        Name_Of_Building_Admin: Fakker::Name.name
        Email_Of_Building_Admin: Fakker::Internet.safe_email
        Phone_Of_Building_Admin: Fakker::PhoneNumber.cell_phone
        Building_Tech_Contact_Name: Fakker::Name.name
        Building_Tech_Contact_Email: Fakker::Internet.safe_email
        Building_Tech_Contact_Phone: Fakker::PhoneNumber.cell_phone
    )
end

20.times do
    BuildingDetail.create(
        Building_Id:
        Information_Key: Fakker::
        Value: Fakker::
    )
end

20.times do
    Batterie.create(
        Building_Id:
        Employee_Id:
        Type: random_type.sample
        Status: random_status.sample
        Date_Of_Commissioning: Fakker::Date.between(from: '2017-09-23', to: '2020-09-25')
        Date_Of_Last_Inspection: Fakker::Date.between(from: '2017-09-23', to: '2020-09-25')
        Certificate_Of_Operations: Fakker::Code.nric
        Information: Fakker::sentence
        Notes: Fakker::Lorem.sentences
    )
end

75.times do 
    Column.create(
        Column_Id:
        Serial_Number: Fakker::Device.serial
        Model: Fakker::Number.hexadecimal(digits: 3)
        Type: random_type.sample
        Status: random_status.sample
        Date_Of_Commissioning: Fakker::Date.between(from: '2017-09-23', to: '2020-09-25')
        Date_Of_Last_Inspection: Fakker::Date.between(from: '2017-09-23', to: '2020-09-25')
        Certificate_Of_Inspection: Fakker::Code.nric
        Information: Fakker::sentence
        Notes: Fakker::Lorem.sentences
    )
end

375.times do
    Elevator.create(
        Column_Id:
        Serial_Number: Fakker::Device.serial
        Model: Fakker::Number.hexadecimal(digits: 3)
        Type: random_type.sample
        Status: random_status.sample
        Date_Of_Commissioning: Fakker::Date.between(from: '2017-09-23', to: '2020-09-25')
        Date_Of_Last_Inspection: Fakker::Date.between(from: '2017-09-23', to: '2020-09-25')
        Certificate_Of_Inspection: Fakker::Code.nric
        Information: Fakker::sentence
        Notes: Fakker::Lorem.sentences
    )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


employee.create!(email: 'nicolas.genest@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'nadya.fortier@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'martin.chantal@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'mathieu.houde@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'david.boutin@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
User.create!(email: 'mathieu.lortie@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
User.create!(email: 'thomas.carrier@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)

User.create!(email: 'nicolas.genest@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'nadya.fortier@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'martin.chantal@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'mathieu.houde@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'david.boutin@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
User.create!(email: 'mathieu.lortie@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
User.create!(email: 'thomas.carrier@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)