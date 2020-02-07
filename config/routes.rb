# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers, controllers: { omniauth_callbacks: 'customers/omniauth_callbacks', sessions: 'customers/sessions' },
             path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :customer do
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_customer_session
  end

  resources :order_items
  resources :orders
  resources :customers
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
