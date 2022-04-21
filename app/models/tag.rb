class Tag < ApplicationRecord
    has_many :tag_relations
    has_many :menus, through: :tag_relations
end
