FactoryBot.define do
  factory :menu do
    name Faker::Name
    sponsor Faker::Company.bs
    event 'COMMERCIAL'
    venue Faker::Address.street_name
    place Faker::Address.street_address
    physical_description Faker::Name
    occasion Faker::Name
    notes Faker::Name
    call_number Faker::PhoneNumber.phone_number
    keywords nil
    language nil
    date Faker::Date
    location Faker::Address.street_address
    location_type nil
    currency 'Dollars'
    currency_symbol '$'
    status 'complete'
    page_count Faker::Number.number(5)
    dish_count Faker::Number.number(5)
  end
end
