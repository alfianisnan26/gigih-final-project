class Menu < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 150}
  validates :price, presence: true, numericality: {only_float: true, greater_than_or_equal_to: 0.01, message: "must be greater or equal than 0.01"}
  validates :category, presence: true
  
  has_many :tag_relations
  has_many :tags, through: :tag_relations
  belongs_to :category
end
