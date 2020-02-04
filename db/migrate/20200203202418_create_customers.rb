# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :mobile_number
      t.string :address

      t.timestamps
    end
  end
end
