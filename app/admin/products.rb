# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :price, :description, :stock, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :stock, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :stock
      row :category
      row :created_at
      row :updated_at

      panel 'Customers Ordered' do
        table_for product.order_items do
          column 'Customer', &:customer
          column 'Order', &:order
          column 'Quantity', &:quantity
          column 'Cost', &:cost
        end
      end
    end
  end
end
