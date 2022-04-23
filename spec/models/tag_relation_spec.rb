require 'rails_helper'

RSpec.describe TagRelation, type: :model do
  it 'is valid when relate a menu and a tag' do
    menu = FactoryBot.create(:menu)
    tag = FactoryBot.create(:tag)
    obj = TagRelation.create(menu: menu, tag: tag)
    expect(tag.menus).to include(menu)
    expect(menu.tags).to include(tag)
  end

  it 'is valid when relatede a menu and many tags' do
    menu = FactoryBot.create(:menu)
    tag1 = FactoryBot.create(:tag)
    TagRelation.create(menu: menu, tag: tag1)
    tag2 = FactoryBot.create(:tag)
    TagRelation.create(menu: menu, tag: tag2)
    tag3 = FactoryBot.create(:tag)
    TagRelation.create(menu: menu, tag: tag3)
    expect(menu.tags.length).to eq(3)
  end

  it 'is valid when relatede many menus and a tag' do
    tag = FactoryBot.create(:tag)
    menu1 = FactoryBot.create(:menu)
    TagRelation.create(menu: menu1, tag: tag)
    menu2 = FactoryBot.create(:menu)
    TagRelation.create(menu: menu2, tag: tag)
    menu3 = FactoryBot.create(:menu)
    TagRelation.create(menu: menu3, tag: tag)
    expect(tag.menus.length).to eq(3)
  end
end
