require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'has many tag_relations' do
    should respond_to(:tag_relations)
  end

  it 'has many menu' do
    should respond_to(:menus)
  end

  it 'is valid with name' do
    obj = FactoryBot.build(:tag)
    obj.valid?
    expect(obj).to be_valid  
  end
  
  it 'is invalid without a name' do
    obj = FactoryBot.build(:tag, name: nil)
    obj.valid?
    expect(obj.errors[:name]).to include("can't be blank")
  end
   
  it 'is invalid with duplicate name' do
    obj1 = FactoryBot.create(:tag)
    obj2 = FactoryBot.build(:tag, name: obj1.name)
    obj2.valid?
    expect(obj2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with name\'s letter length less than 2' do
    tag = FactoryBot.build(:tag, name: "N")

    tag.valid?
    
    expect(tag.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it 'is invalid with name\'s letter length more than 150' do
    tag = FactoryBot.build(:tag, name: Faker::Lorem.characters(number: 151))

    tag.valid?
    
    expect(tag.errors[:name]).to include("is too long (maximum is 150 characters)")
  end
end
