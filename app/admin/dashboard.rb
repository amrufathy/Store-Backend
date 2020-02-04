# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel 'Recent Orders' do
          ul do
            Order.last(5).reverse.map do |order|
              li link_to "Order ##{order.id}", admin_order_path(order)
            end
          end
        end
      end

      column do
        panel 'Most featured products' do
          products = Product.joins(:order_items).group(:product_id).count(:product_id)
                            .sort_by(&:last).reverse.take(5).to_h
          ul do
            products.keys.map do |key|
              product = Product.find(key)
              li link_to product.name, admin_product_path(product)
            end
          end
        end
      end
    end
    # content
  end
end
