FactoryBot.define do
  factory :tag_relation do
    menu { FactoryBot.build(:menu) }
    tag { FactoryBot.build(:tag) }
  end
end
