# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :order
end
