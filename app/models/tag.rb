class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 150}
  has_many :tag_relations
  has_many :menus, through: :tag_relations
end
