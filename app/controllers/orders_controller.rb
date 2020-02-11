# frozen_string_literal: true

class OrdersController < InheritedResources::Base
  def create
    # order = Order.new
    #
    # order_items = params['_json']
    # order_items.each do |item|
    #   puts item
    #   order_item = OrderItem.new
    # end
    # TODO: add order to db
  end

  private

  def order_params
    params.require(:order).permit(:cost)
  end
end
