# frozen_string_literal: true

ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :password, :mobile_number, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password, :mobile_number, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :name
      row :email
      row :mobile_number
      row :address
      row :created_at
      row :updated_at

      panel 'Customer Orders' do
        table_for customer.orders do
          column 'Order' do |order|
            order
          end
          column 'Cost', &:cost
          column 'Created At', &:created_at
          column 'Updated At', &:updated_at
        end
      end
    end
  end
end
