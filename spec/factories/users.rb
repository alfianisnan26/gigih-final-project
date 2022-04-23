FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) + "Aa1_" }
    phone { "+6281318609028" }
    address { Faker::Address.full_address }
    is_admin { Faker::Boolean.boolean }
  end
end
