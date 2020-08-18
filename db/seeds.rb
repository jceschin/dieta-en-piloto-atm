# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

require_relative 'seeds/items'
require_relative 'seeds/sellers'
require_relative 'seeds/categories'

puts "destroying all DailyTargets"
DailyTarget.destroy_all
puts "destroying all OrderItems"
OrderItem.destroy_all
puts "destroying all Orders"
Order.destroy_all
puts "destroying all Users"
User.destroy_all
puts "destroying all ItemCategories"
ItemCategory.destroy_all
puts "destroying all Categories"
Category.destroy_all
puts "destroying all Items"
Item.destroy_all
puts "destroying all Sellers"
Seller.destroy_all
puts "destroying all orders"
Order.destroy_all
puts "destroying all order items"
OrderItem.destroy_all



puts 'Creating Categories'
# Important! when adding a category, add also the picture with its same name
# in app/assets/images/categories/%category_name%.jpg
CATEGORIES_INFO.each do |info|
  c = Category.create(
    name: info[:name],
    picture: "categories/#{info[:name]}.jpg"
    )
  # c.save
end


puts 'Creating Sellers'
n = 0
SELLERS_INFO.each do |info|
  puts "--creating Seller #{info[:name]}"
  s = Seller.new(
    name: info[:name],
    location: info[:location],
    description: info[:description]
    )

  s.save
  puts '--creating Item'
  samplei = ITEMS_INFO[n]
    i = Item.new(
      seller: s,
      name: samplei[:name],
      description:samplei[:description],
      calories: samplei[:calories],
      proteins: samplei[:proteins],
      fats: samplei[:fats],
      carbs: samplei[:carbs],
      origin: samplei[:origin],
      price: samplei[:price],
      )
      picture_file = URI.open(samplei[:picture])
      i.picture.attach(io: picture_file, filename: "#{samplei[:name]}.jpeg", content_type: 'image/jpeg')
    i.save
    n += 1
  puts '--creating ItemCategory'
  samplei[:categories_keywords].each do |category|
    ic = ItemCategory.new(
      item: i,
      category: Category.find_by(name: category)
    )
  ic.save
  end
end


NAMES_INFO = %w(Armando Juan Juanpablo)
NAMES_INFO.each do |name|
  puts "creating User name: #{name}"
  u = User.new(
    email: "#{name.downcase}@gmail.com",
    password:"#{name.downcase}@gmail.com"
    )
  u.save
  puts 'creating Order'
  o = Order.new(
    user: u,
    status: :finished
    )
  o.save
  puts 'creating OrderItem'
  oi = OrderItem.new(
    item: Item.all.sample,
    order: o,
    consumed_at: Time.zone.now
    )
  oi.save
  puts 'creating DailyTarget'
  dt = DailyTarget.new(
    user: u,
    caloric_target: 1800,
    protein_target: 158,
    carb_target: 158,
    fat_target: 60,
    control_limit: 90
    )
  dt.save
end

# Seeds for user-can-buy-items
puts "Creating seeds for user-can-buy-items"

juan_order = Order.create(user: User.find_by(email: "juan@gmail.com"), status: "pending")
juan_item_first = OrderItem.create(item_id: Item.first.id, order_id: juan_order.id)
juan_item_second = OrderItem.create(item_id: Item.second.id, order_id: juan_order.id)
