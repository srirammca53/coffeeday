class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :item
      t.integer :qty
      t.float :price
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
