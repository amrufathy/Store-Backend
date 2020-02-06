# frozen_string_literal: true

class RemoveEmailAndPasswordFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :email
    remove_column :customers, :password
  end
end
