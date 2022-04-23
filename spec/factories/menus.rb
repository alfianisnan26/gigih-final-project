FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    price { Faker::Number.positive }
    stock { Faker::Number.between(from: 1, to: 10) }
    description { Faker::Food.description }
    category { FactoryBot.create(:category) }
  end
end
