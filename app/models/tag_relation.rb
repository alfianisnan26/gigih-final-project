class TagRelation < ApplicationRecord
  belongs_to :menu
  belongs_to :tag
end
