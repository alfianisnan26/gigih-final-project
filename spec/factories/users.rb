FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) + "1" }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    address { Faker::Address.full_address }
    is_admin { Faker::Boolean.boolean }
  end
end
