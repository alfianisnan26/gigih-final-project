class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 64}
  validates :email, presence: true, uniqueness: true, email: {mode: :strict, require_fqdn: true}
  validates :password, presence: true, length: {minimum: 8}
  validate :password_lower_case
  validate :password_uppercase
  validate :password_special_char
  validate :password_contains_number

  def password_uppercase
    return if self.password == nil
    return if !!password.match(/\p{Upper}/)
    errors.add :password, 'must contain at least 1 uppercase'
  end

  def password_lower_case
    return if self.password == nil
    return if !!password.match(/\p{Lower}/)
    errors.add :password, 'must contain at least 1 lowercase'
  end

  def password_special_char
    return if self.password == nil
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if password =~ regex
    errors.add :password, 'must contain at leats 1 special character'
  end

  def password_contains_number
    return if self.password == nil
    return if password.count("0-9") > 0
    errors.add :password, 'must contain at least 1 number'
  end

  before_save {self.is_admin ||= false}
  has_many :invoices
end
