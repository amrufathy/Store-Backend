# frozen_string_literal: true

class ApplicationController < ActionController::Base
  devise_group :user, contains: %i[customer admin]
  before_action :authenticate_mobile!, except: %i[index show]
  before_action :authenticate_user!, except: %i[index show]
  skip_before_action :verify_authenticity_token

  def authenticate_mobile!
    token = params[:token]

    graph = Koala::Facebook::API.new(token)
    user = graph.get_object('me?fields=id,name,email,picture')
    user['token'] = token
    user = OpenStruct.new(user)

    @customer = Customer.from_facebook_mobile(user)

    sign_in @customer, event: :authentication if @customer.persisted?
  end

  def after_sign_in_path_for(_resource_or_scope)
    root_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end
