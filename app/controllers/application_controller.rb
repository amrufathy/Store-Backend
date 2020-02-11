# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include MobileAuthenticatable
  skip_before_action :verify_authenticity_token

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
