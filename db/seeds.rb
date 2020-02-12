# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# create admin
# if Rails.env.development?
Admin.create!(name: 'Admin 1', email: 'admin@example.com', password: 'password',
              password_confirmation: 'password')
# end

# create categories
20.times do
  Category.create!(name: Faker::Commerce.unique.department(max: 1))
end
puts 'Categories created...'

# create customers
Customer.create!(name: 'Amr', email: 'amr@example.com',
                 mobile_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.full_address)
49.times do
  name = Faker::Name.unique.name
  Customer.create!(name: name, email: Faker::Internet.safe_email(name: name),
                   mobile_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.full_address)
end
puts 'Customers created...'

# create products
200.times do
  Product.create!(name: Faker::Commerce.product_name, price: Faker::Commerce.price,
                  description: Faker::Lorem.paragraph(sentence_count: 5), stock: Faker::Number.within(range: 1..15),
                  category: Category.order('RAND()').first)
end
puts 'Products created...'

# create orders (with details)
500.times do
  customer = Customer.order('RAND()').first

  order = Order.create!(customer: customer)
  num_items = Faker::Number.within(range: 3..6)
  total_cost = 0

  num_items.times do
    product = Product.order('RAND()').first
    quantity = Faker::Number.within(range: 1..5)
    total_cost += quantity * product.price

    OrderItem.create!(customer: customer, product: product,
                      order: order, quantity: quantity, cost: quantity * product.price)
  end

  order.update(cost: total_cost)
end
puts 'Orders created...'
