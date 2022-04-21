FactoryBot.define do
  factory :invoice do
    customer { "MyString" }
    waiter { "MyString" }
    subtotal { "MyString" }
    voucher { "MyString" }
    total { "MyString" }
    charge { "MyString" }
    paid_at { "MyString" }
    sent_at { "MyString" }
    done_at { "MyString" }
  end
end
