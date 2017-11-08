FactoryBot.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password
    encrypted_password Faker::Internet.password
    created_at Time.zone.now
    updated_at Time.zone.now
  end
end
