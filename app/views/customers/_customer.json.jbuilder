json.extract! customer, :id, :name, :email, :password, :mobile_number, :address, :created_at, :updated_at
json.url customer_url(customer, format: :json)
