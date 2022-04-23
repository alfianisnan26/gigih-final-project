class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :menu_id
      t.string :real_price
      t.string :quantity
      t.string :invoice

      t.timestamps
    end
  end
end
