# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# create admin
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# create categories
20.times do
  Category.create!(name: Faker::Commerce.unique.department(max: 1))
end
puts 'Categories created...'

# create customers
Customer.create!(name: 'Amr', email: 'amr@example.com', password: 'password',
                 mobile_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.full_address)
49.times do
  name = Faker::Name.unique.name
  Customer.create!(name: name, email: Faker::Internet.safe_email(name: name), password: Faker::Internet.password(mix_case: false),
                   mobile_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.full_address)
end
puts 'Customers created...'

# create products
200.times do
  category_id = Faker::Number.between(from: 1, to: Category.count)

  Product.create!(name: Faker::Commerce.product_name, price: Faker::Commerce.price,
                  description: Faker::Lorem.paragraph(sentence_count: 5), stock: Faker::Number.within(range: 1..15),
                  category: Category.find(category_id))
end
puts 'Products created...'


# create orders (with details)
500.times do
  customer_id = Faker::Number.between(from: 1, to: Customer.count)

  order = Order.create!(customer: Customer.find(customer_id))
  num_items = Faker::Number.within(range: 3..6)
  total_cost = 0

  num_items.times do
    product_id = Faker::Number.between(from: 1, to: Product.count)
    product = Product.find(product_id)
    quantity = Faker::Number.within(range: 1..5)
    total_cost += quantity * product.price

    OrderItem.create!(customer: Customer.find(customer_id), product: Product.find(product_id),
                      order: order, quantity: quantity, cost: quantity * product.price)
  end

  order.update(cost: total_cost)
end
puts 'Orders created...'