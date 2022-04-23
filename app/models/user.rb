class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 64}
  has_many :invoices
end
