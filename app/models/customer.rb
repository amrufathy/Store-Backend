# frozen_string_literal: true

class Customer < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :order_items
  has_many :orders
  has_many :products, through: :order_items

  def self.new_with_session(params, session)
    super.tap do |customer|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        customer.email = data['email'] if customer.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |customer|
      customer.uid = auth.uid
      customer.email = auth.info.email
      # customer.password = Devise.friendly_token[0, 20]
      customer.token = auth.credentials.token
      customer.username = auth.info.name # assuming the customer model has a name
      customer.image = auth.info.image # assuming the customer model has an image
    end
  end

  def self.from_facebook_mobile(user)
    where(uid: user.id).first_or_create do |customer|
      customer.uid = user.id
      customer.email = user.email
      customer.token = user.token
      customer.username = user.name
      customer.image = user.picture['data']['url']
    end
  end
end
