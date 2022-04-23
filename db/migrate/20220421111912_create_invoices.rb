class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.integer :waiter_id
      t.integer :voucher_id
      t.float :subtotal
      t.float :total
      t.float :charge
      t.float :return
      t.datetime :paid_at
      t.datetime :sent_at
      t.datetime :done_at

      t.timestamps
    end
  end
end
