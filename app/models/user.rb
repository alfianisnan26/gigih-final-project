class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 64}
  validates :email, presence: true, uniqueness: true, email: {mode: :strict, require_fqdn: true}
  before_save {self.is_admin ||= false}
  has_many :invoices
  
end
