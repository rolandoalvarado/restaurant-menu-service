FactoryBot.define do
  factory :dish do
    name Faker::Name
    description nil
    menus_appeared Faker::Number.number(5)
    times_appeared Faker::Number.number(5)
    first_appeared Faker::Number.number(5)
    last_appeared Faker::Number.number(5)
    lowest_price Faker::Number.decimal(2)
    highest_price Faker::Number.decimal(2)
  end
end
