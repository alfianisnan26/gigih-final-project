FactoryBot.define do
  factory :category do
    name { Faker::Food.ethnic_category }
    description { Faker::Lorem.sentence }
  end
end
