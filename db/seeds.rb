# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
descriptions = ["you are a tv.. and you held so much show tv to make life happier.", "VCR is past technology, but he got some great years.", "macbook is still at is best days, and kepp improve the technology scene."]
Product.create!(name: "Test Product", inventory: 0, description: "This is a test description with more text than should be there.")
10.times do
  products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
  Product.create(:name => products.sample, :description => descriptions.sample, :price => Faker::Number.between(1,1500))
end
5.times do
  Customer.create(:name => Faker::Name.name)
end

5.times do
  Invoice.create
end
10.times do
  order = Order.create(:customer_id => Customer.all.collect(&:id).sample, :invoice_id => Invoice.all.collect(&:id).sample)
  order.products << Product.find(Product.all.collect(&:id).sample)
end
