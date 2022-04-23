require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has many menus' do
    should respond_to(:menus)
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
  
end
