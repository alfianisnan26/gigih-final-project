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
  pending 'is invalid without a name'
  pending 'is invalid with name\'s letter length more than 64'
  pending 'is invalid with name\'s letter length less than 2'
  pending 'is invalid without an email'
  pending 'is invalid when email is malformatted'
  pending 'is invalid without a password'
  pending 'is invalid without a phone'
  pending 'is valid without address and set to blank'
  pending 'is valid without is_admin and set to false'
  
end
