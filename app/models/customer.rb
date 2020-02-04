class Customer < ApplicationRecord
  has_many :order_items
  has_many :orders
  has_many :products, through: :order_items
end
