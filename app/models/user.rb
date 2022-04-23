class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 64}
  before_save {self.is_admin ||= false}
  has_many :invoices
end
