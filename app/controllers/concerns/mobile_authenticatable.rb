module MobileAuthenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_mobile!, except: %i[index show]
  end

  protected

  def authenticate_mobile!
    token = params[:token]

    graph = Koala::Facebook::API.new(token)
    user = graph.get_object('me?fields=id,name,email,picture')
    user['token'] = token
    user = OpenStruct.new(user)

    @customer = Customer.from_facebook_mobile(user)

    sign_in @customer, event: :authentication if @customer.persisted?
  end
end

