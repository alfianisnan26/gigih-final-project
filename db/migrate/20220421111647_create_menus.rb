class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.float :price
      t.integer :stock
      t.string :description
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
