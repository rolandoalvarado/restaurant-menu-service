FactoryBot.define do
  factory :menu_page do
    page_number Faker::Number.number(5)
    image_id Faker::Number.number(10)
    full_height Faker::Number.number(5)
    full_width Faker::Number.number(5)
    uuid SecureRandom.uuid
  end
end
