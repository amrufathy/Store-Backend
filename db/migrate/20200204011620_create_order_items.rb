class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.float :cost

      t.timestamps
    end
  end
end
