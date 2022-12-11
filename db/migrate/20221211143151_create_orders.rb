class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :mobile
      t.string :status
      t.boolean :notified
      t.float :total_price
      t.float :total_tax
      t.float :bill_amount

      t.timestamps
    end
  end
end
