# frozen_string_literal: true

class OrdersController < InheritedResources::Base
  include Authenticatable

  def create
    new_order = Order.create(customer: current_customer)
    new_order_cost = 0

    order_items_json = params['_json']
    order_items_json.each do |item|
      puts item
      OrderItem.create(
          customer: current_customer,
          product: Product.find(item['product_id']),
          order: new_order,
          quantity: item['quantity'],
          cost: item['cost']
      )

      new_order_cost += item['cost']
    end

    new_order.update(cost: new_order_cost)
    render json: [new_order.id]
  end

  def items
    render json: Order.find(params[:id]).order_items.joins(:product).select('order_items.*, products.name')
  end

  private

  def order_params
    params.require(:order).permit(:cost)
  end
end
