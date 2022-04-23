class CreateTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_relations do |t|
      t.integer :menu_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
