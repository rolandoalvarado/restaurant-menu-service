FactoryBot.define do
  factory :menu_item do
    price Faker::Number.decimal(2)
    high_price Faker::Number.decimal(2)
    created_at Time.zone.now
    updated_at Time.zone.now
    xpos Faker::Number.positive
    ypos Faker::Number.positive
  end
end
