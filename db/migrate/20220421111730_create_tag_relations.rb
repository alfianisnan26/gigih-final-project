class CreateTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_relations do |t|
      t.belongs_to :menu, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
