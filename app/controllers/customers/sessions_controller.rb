# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_user, only: :destroy
  skip_before_action :authenticate_mobile!

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def create
  #   customer = Customer.from_omniauth(env["omniauth.auth"])
  #   session[:customer_id] = customer.id
  #   redirect_to root_path
  # end
  #
  # def destroy
  #   session.delete[:customer_id] = nil
  #   redirect_to root_path
  # end
end
