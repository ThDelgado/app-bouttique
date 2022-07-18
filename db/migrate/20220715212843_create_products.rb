class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.decimal :price
      t.integer :stock
      t.string :size
      t.string :color
      t.string :brand

      t.timestamps
    end
  end
end
