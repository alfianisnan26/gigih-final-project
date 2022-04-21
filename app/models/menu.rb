class Menu < ApplicationRecord
    has_many :tag_relations
    has_many :tags, through: :tag_relations
end
