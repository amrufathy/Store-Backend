class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :stock
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
