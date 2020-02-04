# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :cost, :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:cost, :customer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :customer
      row :cost
      row :created_at
      row :updated_at

      panel 'Order Items' do
        table_for order.order_items do
          column 'Product', &:product
          column 'Price per Item' do |order_item|
            order_item.product.price
          end
          column 'Quantity', &:quantity
          column 'Category' do |order_item|
            order_item.product.category
          end
          column 'Stock remaining' do |order_item|
            order_item.product.stock
          end
        end
      end
    end
  end
end
