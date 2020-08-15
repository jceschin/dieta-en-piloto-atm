# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

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


SELLERS_INFO = [
  {
    name: 'Dandy Deli',
    location: "Olga Cossettini 711, Buenos Aires C1107CDA, Argentina",
    description: "Opciones sin gluten, Apto para vegetarianos, Opciones veganas, Apto para vegetarianos, Opciones veganas, Opciones sin gluten"
  },
  {
    name: 'Casa Munay',
    location: "Scalabrini Ortiz 2018, Buenos Aires C1425DBO, Argentina",
    description: "Saludable, Café, Fusión, Sopas, Opciones sin gluten, Apto para vegetarianos, Opciones veganas"
  },
  {
    name: 'Surris Hill Coffee',
    location: "Calle Jorge Luis Borges 1842, Buenos Aires C1414DGF, Argentina",
    description: "Francesa, Estadounidense, Café, Saludable, Desayuno, Almuerzo, Brunch, Bebidas"
  },
  {
    name: 'Moshu',
    location: "Moldes 3802, Buenos Aires C1429AFT, Argentina",
    description: "Café, Delicatessen, Saludable, Argentina, Sudamericana, Apto para vegetarianos, Opciones sin gluten"
  }
]

ITEMS_INFO = [
  {
    name: "Ensalada Mikonos" ,
    description: "Atún, rúcula, espinaca, aceitunas negras, croutones, palta, tomates y queso sardo...",
    calories: 300,
    proteins: 40,
    fats: 15,
    carbs: 10,
    origin: :seller,
    price: 1000,
    categories_keywords: ["ensaladas", "pescados"],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596648435/rh9nfmwoba1hgjxmrx3o.jpg"
  },
    {
    name: "Ensalada Crispy" ,
    description: "Lechuga romana, tomates cherry, pepino, mango, queso mozarella, pechuga de pollo, ajo, sal y pimienta.",
    calories: 338,
    proteins: 42,
    fats: 15,
    carbs: 9,
    origin: :seller,
    price: 700,
    categories_keywords: ["ensaladas"],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596648827/r5r5bezu4uaxdalw8nt4.png"
  },
  {
    name: "Burger Zarpada" ,
    description: "Doble carne con doble cheddar, mostaza, ketchup y cebolla brunoise.",
    calories: 279,
    proteins: 13,
    fats: 14,
    carbs: 27,
    origin: :seller,
    price: 500,
    categories_keywords: ["hamburgesas", "carnes"],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596649435/dbqozlifg2b2fxwwzrul.png"
  },
      {
    name: "Pasta Bolognese" ,
    description: "pasta aechuga de pollo, aceite de oliva, panceta, cebolla. salsa inglesa",
    calories: 45,
    proteins: 1,
    fats: 1,
    carbs: 6,
    origin: :seller,
    price: 450,
    categories_keywords: ["pastas", "carnes"],
    picture: "https://res.cloudinary.com/ajtvlggc/image/upload/v1596654426/i30zaepgl1soxwwqk2kc.jpg"
  }
]

CATEGORIES_INFO = [
  {
    name: "ensaladas",
  },
  {
    name: "hamburguesas",
  },
  {
    name: "pollos",
  },
  {
    name: "carnes",
  },
  {
    name: "postres",
  },
  {
    name: "pizzas",
  },
  {
    name: "pastas",
  },
  {
    name: "pescados",
  }
]

puts 'creating Category'
CATEGORIES_INFO.each do |info|
  c = Category.new(
    name: info[:name],
    picture: "categories/#{info[:name]}.jpg"
    )
  c.save
end
n = 0
SELLERS_INFO.each do |info|
  puts "creating Seller #{info[:name]}"
  s = Seller.new(
    name: info[:name],
    location: info[:location],
    description: info[:description]
    )

  s.save
  puts 'creating Item'
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
  puts 'creating ItemCategory'
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
    order: o
    )
  oi.save
  puts 'creating DailyTarget'
  dt = DailyTarget.new(
    user: u)
end

# Seeds for user-can-buy-items
puts "Creating seeds for user-can-buy-items"

juan_order = Order.create(user: User.find_by(email: "juan@gmail.com"), status: "pending")
juan_item_first = OrderItem.create(item_id: Item.first.id, order_id: juan_order.id)
juan_item_second = OrderItem.create(item_id: Item.second.id, order_id: juan_order.id)
