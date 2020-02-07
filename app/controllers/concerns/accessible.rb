# frozen_string_literal: true

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_admin
      flash.clear
      redirect_to(admin_dashboard_path) && return
    elsif current_customer
      flash.clear
      redirect_to(root_path) && return
    end
  end
end
