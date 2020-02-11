# frozen_string_literal: true

class OrderItemsController < InheritedResources::Base
  include Authenticatable

  private

  def order_item_params
    params.require(:order_item).permit(:customer_id, :product_id, :order_id, :quantity, :cost)
  end
end
