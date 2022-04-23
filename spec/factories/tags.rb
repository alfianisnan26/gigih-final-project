FactoryBot.define do
  factory :tag do
    name { Faker::Food.ethnic_category }
  end
end
