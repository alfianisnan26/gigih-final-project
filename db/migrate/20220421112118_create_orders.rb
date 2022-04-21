class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :menu, foreign_key: true
      t.string :real_price
      t.string :quantity
      t.string :invoice

      t.timestamps
    end
  end
end
