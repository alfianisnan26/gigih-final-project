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

  it 'has valid data' do
    obj = FactoryBot.build(:user)
    obj.valid?
    expect(obj).to be_valid  
  end
  describe 'name' do
    it 'is invalid without a name' do
      obj = FactoryBot.build(:user, name: nil)
      obj.valid?
      expect(obj.errors[:name]).to include("can't be blank")
    end
    it 'is invalid with name\'s letter length more than 64' do
      obj = FactoryBot.build(:user, name: Faker::Lorem.characters(number: 65))
      obj.valid?
      expect(obj.errors[:name]).to include("is too long (maximum is 64 characters)")
    end
    it 'is invalid with name\'s letter length less than 2' do
      obj = FactoryBot.build(:user, name: "A")
      obj.valid?
      expect(obj.errors[:name]).to include("is too short (minimum is 2 characters)")
    end
  end
  describe 'email' do
    it'is invalid without an email' do
      obj = FactoryBot.build(:user, email: nil)
      obj.valid?
      expect(obj.errors[:name]).to include("can't be blank")
    end
    it 'is invalid when email is malformatted' do
      ["alfian isnan", "alfianisnan", "alfian@isnan", "alfian isnan@google", "alfian.isnan@google"].each do |email|
        obj = FactoryBot.build(:user, email: email)
        obj.valid?
        expect(obj.errors[:name]).to include("malformatted")
      end
    end
    it 'is invalid with duplicate email' do
      obj = FactoryBot.build(:user)
      obj.valid?
      expect(obj.errors[:name]).to include("has already been taken")
    end
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
  describe 'address' do
    pending 'is valid without address and set to blank'
    pending 'is invalid when address letter length more than 150'
  end
  it 'is valid without is_admin and set to false' do
    obj = FactoryBot.create(:user, is_admin: nil)
    expect(obj.is_admin).to eq(false)
  end
  
end
