module Authenticatable
  extend ActiveSupport::Concern

  included do
    include MobileAuthenticatable

    devise_group :user, contains: %i[customer admin]
    before_action :authenticate_user!, except: %i[index show]
  end
end
