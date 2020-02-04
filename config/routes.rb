Rails.application.routes.draw do
  resources :order_items
  resources :orders
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :admins
  resources :customers
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
