require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has many menus' do
    should respond_to(:menus)
  end

  
end
