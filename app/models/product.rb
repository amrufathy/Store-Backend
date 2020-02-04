class Product < ApplicationRecord
  belongs_to :category
  belongs_to :order_item, optional: true
  has_many :customers, through: :order_item
end
