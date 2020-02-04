# frozen_string_literal: true

class OrdersController < InheritedResources::Base
  private

  def order_params
    params.require(:order).permit(:cost)
  end
end
