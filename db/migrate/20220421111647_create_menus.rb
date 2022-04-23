class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.float :price
      t.integer :stock
      t.string :description, default: ""
      t.integer :category_id

      t.timestamps
    end
  end
end
