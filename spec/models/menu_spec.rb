require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "has many tags" do
    should respond_to(:tags)
  end

  it 'is valid with name, price, and desc' do
    menu = FactoryBot.build(:menu)
    menu.valid?
    expect(menu).to be_valid  
  end

  it 'is valid without desc default set to empty string' do
    menu = FactoryBot.create(:menu, description: nil)
    expect(menu.description).to eq("")  
  end

  it 'is invalid without a name' do
    menu = FactoryBot.build(:menu, name: nil)
    menu.valid?
    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a category' do
    menu = FactoryBot.build(:menu, category: nil)
    menu.valid?
    expect(menu.errors[:category]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    menu = FactoryBot.build(:menu, price: nil)
    menu.valid?
    expect(menu.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with non-numeric price' do
    menu = FactoryBot.build(:menu, price: "seribu")
    menu.valid?
    expect(menu.errors[:price]).to include("must be greater or equal than 0.01")
  end

  it 'is invalid with duplicate name' do
    menu1 = FactoryBot.create(:menu)
    menu2 = FactoryBot.build(:menu, name: menu1.name)
    menu2.valid?
    expect(menu2.errors[:name]).to include("has already been taken")
  end

   describe "self#validates :numericallity {must_greater_or_equals_than: 0.01}" do
    # TODO: 2.1
    it "0.0 \tis invalid with price less than 0.01" do
      menu = FactoryBot.build(:menu, price: 0)
  
      menu.valid?
  
      expect(menu.errors[:price]).to include("must be greater or equal than 0.01")
    end
    
    # TODO: 2.2
    it "0.009\tis invalid with price less than 0.01" do
      menu = FactoryBot.build(:menu, price: 0.009)
  
      menu.valid?
  
      expect(menu.errors[:price]).to include("must be greater or equal than 0.01")
    end
  
    # TODO: 2.3
    it "0.01\tis valid with price greater or equal than 0.01" do
      menu = FactoryBot.build(:menu, price: 0.01)
  
      menu.valid?
  
      expect(menu).to be_valid
    end
  
    # TODO: 2.4
    it "1.05\tis valid with price greater or equal than 0.01" do
      menu = FactoryBot.build(:menu, price: 1.05)
  
      menu.valid?
  
      expect(menu).to be_valid
    end
  end
  
  it 'is invalid with name\'s letter length less than 2' do
    menu = FactoryBot.build(:menu, name: "N")

    menu.valid?
    
    expect(menu.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it 'is invalid with name\'s letter length more than 150' do
    menu = FactoryBot.build(:menu, name: Faker::Lorem.characters(number: 151))

    menu.valid?
    
    expect(menu.errors[:name]).to include("is too long (maximum is 150 characters)")
  end
  
end
