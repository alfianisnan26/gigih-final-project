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
      expect(obj.errors[:email]).to include("can't be blank")
    end
    it 'is invalid when email is malformatted' do
      ["alfian isnan", "alfianisnan", "alfian@isnan", "alfian isnan@google", "alfian.isnan@google"].each do |email|
        obj = FactoryBot.build(:user, email: email)
        obj.valid?
        expect(obj.errors[:email]).to include("is invalid")
      end
    end
    it 'is invalid with duplicate email' do
      obj1 = FactoryBot.create(:user)
      obj2 = FactoryBot.build(:user, email: obj1.email)
      obj2.valid?
      expect(obj2.errors[:email]).to include("has already been taken")
    end
  end
  describe 'password' do
    
    describe 'password_validation' do
      it 'is invalid without a password' do
        obj = FactoryBot.build(:user, password: nil)
        obj.valid?
        expect(obj.errors[:password]).to include("can't be blank")
      end
      it 'is invalid when password letter length less than 8' do
        obj = FactoryBot.build(:user, password: "Man123_")
        obj.valid?
        expect(obj.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
      it 'is invalid when password not contain at least 1 uppercase' do
        obj = FactoryBot.build(:user, password: "aman1234_")
        obj.valid?
        expect(obj.errors[:password]).to include("must contain at least 1 uppercase")
      end
      it 'is invalid when password not contain at least 1 lowercase' do
        obj = FactoryBot.build(:user, password: "AMAN1234_")
        obj.valid?
        expect(obj.errors[:password]).to include("must contain at least 1 lowercase")
      end
      it 'is invalid when password not contain at least 1 special character' do
        obj = FactoryBot.build(:user, password: "AMAN12345")
        obj.valid?
        expect(obj.errors[:password]).to include("must contain at least 1 special character")
      end
      it 'is invalid when password not contain at least 1 number' do
        obj = FactoryBot.build(:user, password: "AMANBANGET_")
        obj.valid?
        expect(obj.errors[:password]).to include("must contain at least 1 number")
      end
    end
    it 'is invalid if generated password equals to plain-password' do
      obj_pre = FactoryBot.build(:user)
      obj = FactoryBot.create(:user, password: obj_pre.password)
      expect(obj.password).not_to eq(obj_pre.password)
    end
    
    it 'is valid if password hash are equals when checking password' do
      obj_pre = FactoryBot.build(:user)
      obj = FactoryBot.create(:user, password: obj_pre.password)
      expect(obj.check_password(obj_pre.password)).to be true
    end
  end
  describe 'phone' do
    it 'is invalid without a phone' do
      obj = FactoryBot.build(:user, phone: nil)
      obj.valid?
      expect(obj.errors[:phone]).to include("can't be blank")
    end
    it 'is invalid when phone is malformatted' do
      obj = FactoryBot.build(:user, phone: "12345")
      obj.valid?
      expect(obj).to be_invalid
    end
    it 'is invalid with duplicate phone' do
      obj1 = FactoryBot.create(:user)
      obj2 = FactoryBot.build(:user, phone: obj1.phone)
      obj2.valid?
      expect(obj2.errors[:phone]).to include("has already been taken")
    end
  end
  describe 'address' do
    it 'is valid without address and set to blank' do
      obj = FactoryBot.build(:user, address: nil)
      obj.valid?
      expect(obj.errors[:address]).to include("can't be blank")
    end
    it 'is invalid when address letter length more than 150' do
      obj = FactoryBot.build(:user, address: Faker::Lorem.characters(number: 151))
      obj.valid?
      expect(obj.errors[:address]).to include("is too long (maximum is 150 characters)")
    end
  end
  it 'is valid without is_admin and set to false' do
    obj = FactoryBot.create(:user, is_admin: nil)
    expect(obj.is_admin).to be false
  end
  
end
