# frozen_string_literal: true

ActiveAdmin.register Category do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at

      panel 'Category Products' do
        table_for category.products do
          column 'Product' do |product|
            product
          end
          column 'Price per Item', &:price
          column 'Category', &:category
          column 'Stock remaining', &:stock
        end
      end
    end
  end
end
