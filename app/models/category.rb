class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 150}
  before_save {self.description ||= ""}
  
  has_many :menus
  
end
