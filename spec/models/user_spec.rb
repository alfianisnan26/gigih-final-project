require 'rails_helper'
#       t.string :name
#       t.string :email
#       t.string :password
#       t.string :phone
#       t.string :address
#       t.boolean :is_admin

RSpec.describe User, type: :model do
  it 'has many invoices' do
    should respond_to(:invoices)
  end

  pending 'has valid data'
  describe 'name' do
    pending 'is invalid without a name'
    pending 'is invalid with name\'s letter length more than 64'
    pending 'is invalid with name\'s letter length less than 2'
  end
  describe 'email' do
    pending 'is invalid without an email'
    pending 'is invalid when email is malformatted'
    pending 'is invalid with duplicate email'
  end
  describe 'password' do
    pending 'is invalid without a password'
    pending 'is invalid if generated password equals to plain-password'
    pending 'is valid if password hash are equals when checking password'
  end
  describe 'phone' do
    pending 'is invalid without a phone'
    pending 'is invalid when phone is malformatted'
    pending 'is invalid with duplicate phone'
  end
  pending 'is valid without address and set to blank'
  pending 'is valid without is_admin and set to false'
  
end
