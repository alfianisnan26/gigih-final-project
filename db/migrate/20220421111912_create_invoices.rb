class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.belongs_to :customer, class_name: "User", foreign_key: true
      t.belongs_to :waiter,  class_name: "User", foreign_key: true
      t.float :subtotal
      t.belongs_to :voucher, foreign_key: true
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
