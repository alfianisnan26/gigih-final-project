class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.float :min_subtotal
      t.float :max_discount
      t.float :discount
      t.string :name
      t.string :code
      t.string :description
      t.boolean :is_active
      t.integer :stock
      t.datetime :valid_thru

      t.timestamps
    end
  end
end
