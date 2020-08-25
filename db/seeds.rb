# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

require_relative 'methods'
require_relative 'seeds/items'
require_relative 'seeds/sellers'
require_relative 'seeds/categories'


# Deletes all table data in db
reset_data

puts 'Creating Categories'
# Important! when adding a category, add also the picture with its same name
# in app/assets/images/categories/%category_name%.jpg
CATEGORIES_INFO.each do |info|
  puts "--creating #{info[:name]}"
  Category.create!(
    name: info[:name],
    picture: "categories/#{info[:name]}.jpg"
    )
end

puts 'Creating Sellers'
SELLERS_INFO.each do |info|
  puts "--creating #{info[:name]}"
  Seller.create!(
    name: info[:name],
    location: info[:location],
    description: info[:description]
    )
end

puts 'Creating Items'
ITEMS_INFO.each do |info|
  puts "--creating #{info[:name]}"
  item = Item.new(
    name: info[:name],
    seller: Seller.find_by(name: info[:seller]),
    description:info[:description],
    calories: info[:calories],
    proteins: info[:proteins],
    fats: info[:fats],
    carbs: info[:carbs],
    origin: info[:origin],
    price: info[:price],
  )
  picture_file = URI.open(info[:picture])
  # oportunidad de mejora para no volver a subir las imagenes que ya esatn subidas
  item.picture.attach(io: picture_file, filename: "#{info[:name]}.jpeg", content_type: 'image/jpeg')
  item.save!
  puts '--creating Item Categories'
  info[:categories_keywords].each do |category|
    ic = ItemCategory.new(
      item: item,
      category: Category.find_by(name: category)
    )
    ic.save
  end
end

puts 'Creating Users'
NAMES_INFO = %w(Armando Juan Juanpablo)
NAMES_INFO.each do |name|
  puts "creating User name: #{name}"
  u = User.new(
    email: "#{name.downcase}@gmail.com",
    password:"#{name.downcase}@gmail.com"
    )
  u.save
  # puts 'creating Order'
  # o = Order.new(
  #   user: u,
  #   status: :finished
  #   )
  # o.save
  # puts 'creating OrderItem'
  # oi = OrderItem.new(
  #   item: Item.all.sample,
  #   order: o,
  #   consumed_at: Time.zone.now
  #   )
  # oi.save
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

# # Seeds for user-can-buy-items
# puts "Creating seeds for user-can-buy-items"

# juan_order = Order.create(user: User.find_by(email: "juan@gmail.com"), status: "pending")
# juan_item_first = OrderItem.create(item_id: Item.first.id, order_id: juan_order.id)
# juan_item_second = OrderItem.create(item_id: Item.second.id, order_id: juan_order.id)
