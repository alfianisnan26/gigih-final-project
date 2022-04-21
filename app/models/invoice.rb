class Invoice < ApplicationRecord
    has_many :orders
end
