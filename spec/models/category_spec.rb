require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has many categorys' do
    should respond_to(:categorys)
  end

  it 'is valid with name and desc' do
    obj = FactoryBot.build(:category)
    obj.valid?
    expect(obj).to be_valid  
  end
  it 'is valid without a description and set to empty string' do
    obj = FactoryBot.create(:category)
    obj.valid?
    expect(obj.description).to eq("")
  end 
  
  it 'is invalid without a name' do
    obj = FactoryBot.build(:category)
    obj.valid?
    expect(obj.errors[:name]).to include("can't be blank")
  end
   
  it 'is invalid with duplicate name' do
    obj1 = FactoryBot.create(:category)
    obj2 = FactoryBot.build(:category, name: obj1.name)
    obj2.valid?
    expect(obj2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with name\'s letter length less than 2' do
    category = FactoryBot.build(:category, name: "N")

    category.valid?
    
    expect(category.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it 'is invalid with name\'s letter length more than 150' do
    category = FactoryBot.build(:category, name: Faker::Lorem.characters(number: 151))

    category.valid?
    
    expect(category.errors[:name]).to include("is too long (maximum is 150 characters)")
  end
  
end
