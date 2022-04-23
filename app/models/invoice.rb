class Invoice < ApplicationRecord
    has_many :orders
    belongs_to :customer, class_name: "User"
    belongs_to :waiter,  class_name: "User"
    belongs_to :voucher
end
