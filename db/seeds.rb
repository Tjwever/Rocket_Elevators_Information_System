
CSV.foreach(Rails.root.join('address.csv'), headers: true) do |row|
    # puts row.inspect
end

random_type = ["residential", "commercial", "corporate"]
random_status = ["Active", "Inactive"]
departement_selector = ["Sales","Customer Services","Administration"]
info_key = ["Type, Construction Year, Last Renovation Year, Number of elevator in place"]
random_values = [random_type.sample, Faker::Date.between(from: '1945-09-23', to: '1990-09-25'), Faker::Date.between(from: '1991-09-23', to: '2010-09-25'), Faker::Number.between(from: 1, to: 7)]
random_address = CSV.readlines(Rails.root.join('address.csv'))


User.create!(email: 'nicolas.genest@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'nadya.fortier@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'martin.chantal@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'mathieu.houde@codeboxx.biz', password: '123456', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'david.boutin@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
User.create!(email: 'mathieu.lortie@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)
User.create!(email: 'thomas.carrier@codeboxx.biz', password: '123456', superadmin_role: 0, employee_role: 1, user_role: 0)


Employee.create!(firstName: 'Nicolas', lastName: 'Genest', title: "CEO", users_id: 1)
Employee.create!(firstName: 'Nadya', lastName: 'Fortier', title: "Director", users_id: 2)
Employee.create!(firstName: 'Martin', lastName: 'Chantal', title: "Director-Assistant", users_id: 3)
Employee.create!(firstName: 'Mathieu', lastName: 'Houde', title: "Captain", users_id: 4)
Employee.create!(firstName: 'David', lastName: 'Boutin', title: "Engineer", users_id: 5)
Employee.create!(firstName: 'Mathieu', lastName: 'Lortie', title: "Engineer", users_id: 6)
Employee.create!(firstName: 'Thomas', lastName: 'Carrier', title: "Engineer", users_id: 7)


52.times do
    Lead.create(
        fullName: Faker::Name.name,
        companyName: Faker::Company.name,
        email: Faker::Internet.safe_email,
        phone: Faker::PhoneNumber.cell_phone,
        projectName: Faker::Space.star,
        projectDescription: Faker::Company.catch_phrase,
        department: departement_selector.sample,
        subject: Faker::Lorem.sentence,
        message: Faker::Lorem.paragraphs,
    )
end

15.times do
    Customer.create!(
        name_of_company: Faker::Company.name,
        company_hq_address: random_address.sample,
        name_of_company_contact: Faker::Name.name,
        company_contact_phone: Faker::PhoneNumber.cell_phone,
        company_contact_email: Faker::Internet.safe_email,
        company_description: Faker::Company.buzzword,
        tech_authority_name: Faker::Name.name,
        tech_authority_phone: Faker::PhoneNumber.cell_phone,
        tech_manager_email: Faker::Internet.safe_email,
        users_id:Faker::Number.between(from: 1, to: 7), 
    )
end

20.times do
    Building.create!(
        building_address: "test",
        name_of_building_admin: Faker::Name.name,
        email_of_building_admin: Faker::Internet.safe_email,
        phone_of_building_admin: Faker::PhoneNumber.cell_phone,
        building_tech_contact_name: Faker::Name.name,
        building_tech_contact_email: Faker::Internet.safe_email,
        building_tech_contact_phone: Faker::PhoneNumber.cell_phone,
        customer_id: Faker::Number.between(from: 1, to: 15),
    )
end

20.times do
    BuildingDetail.create!(
        information_key: info_key,
        value: [random_type.sample, Faker::Date.between(from: '1945-09-23', to: '1990-09-25'), Faker::Date.between(from: '1991-09-23', to: '2010-09-25'), Faker::Number.between(from: 1, to: 7)],
        building_id: Faker::Number.between(from: 1, to: 20),
    )
end

20.times do
    Battery.create(
        types: random_type.sample,
        status: random_status.sample,
        date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2020-09-25'),
        date_of_last_inspection: Faker::Date.between(from: '2017-09-23', to: '2020-09-25'),
        certificate_of_operations: Faker::Code.nric,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentences,
        employee_id: Faker::Number.between(from: 1, to: 7),
        building_id: Faker::Number.between(from: 1, to: 20),
    )
end

75.times do 
    Column.create!(
        types: random_type.sample,
        status: random_status.sample,
        nb_of_floor_served: Faker::Number.between(from: 5, to: 25),
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentences,
        battery_id: Faker::Number.between(from: 1, to: 20)
    )
end

375.times do
    Elevator.create!(
        serial_number: Faker::Barcode.ean_with_composite_symbology ,
        model: Faker::Number.hexadecimal(digits: 3),
        types: random_type.sample,
        status: random_status.sample,
        date_of_commissioning: Faker::Date.between(from: '2017-09-23', to: '2020-09-25'),
        date_of_last_inspection: Faker::Date.between(from: '2020-01-23', to: '2020-09-25'),
        certificate_of_inspection: Faker::Code.nric,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentences,
        column_id: Faker::Number.between(from: 1, to: 75),
    )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





