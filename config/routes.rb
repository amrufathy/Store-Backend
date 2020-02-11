# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks', sessions: 'customers/sessions' },
             path_names: { sign_in: 'login', sign_out: 'logout' }

  get '/check_mobile_login', to: 'customers#check_mobile_login'

  resources :order_items
  resources :orders
  resources :customers
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
