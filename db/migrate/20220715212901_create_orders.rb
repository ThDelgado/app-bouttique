class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.string :state
      t.decimal :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
