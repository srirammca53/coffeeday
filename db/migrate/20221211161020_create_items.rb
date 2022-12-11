class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :qty
      t.float :price

      t.timestamps
    end
  end
end
