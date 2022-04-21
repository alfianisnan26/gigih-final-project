class Voucher < ApplicationRecord
    has_many :invoices
end
