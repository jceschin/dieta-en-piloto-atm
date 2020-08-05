# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    calories: 1000,
    proteins: 20,
    fats: 30,
    carbs: 20,
    origin: :seller,
    price: 1000,
    categories_keywords: ["ensaladas", "pescados"]
  },
  {
    name: "Ensalada Mikonos" ,
    description: "Lechuga romana, tomates cherry, pepino, mango, queso mozarella, pechuga de pollo, ajo, sal y pimienta.",
    calories: 1000,
    proteins: 20,
    fats: 30,
    carbs: 20,
    origin: :seller,
    price: 700,
    categories_keywords: ["ensaladas"]
  },
  {
    name: "Burger Zarpada" ,
    description: "Doble carne con doble cheddar, mostaza, ketchup y cebolla brunoise.",
    calories: 1000,
    proteins: 20,
    fats: 30,
    carbs: 20,
    origin: :seller,
    price: 500,
    categories_keywords: ["hamburgesas", "carnes"]
  }
]

## CATEGORIES_INFO = %w(ensaladas hamburguesas pollos carnes postres pizzas pastas pescados)

CATEGORIES_INFO = [
  {
    name: "ensaladas",
    picture: '../assets/images/ensaladas.jpg'
  },
  {
    name: "hamburgesas",
    picture: '../assets/images/hamburguesa.jpeg'
  },
  {
    name: "pollos",
    picture: '../assets/images/pollos.jpg'
  },
  {
    name: "carnes",
    picture: '../assets/images/carnes.jpg'
  },
  {
    name: "postres",
    picture: '../assets/images/postres.jpg'
  },
  {
    name: "pizzas",
    picture: '../assets/images/pizzas.jpg'
  },
  {
    name: "pastas",
    picture: '../assets/images/pastas.jpg'
  },
  {
    name: "pescados",
    picture: '../assets/images/pescados.jpg'
  }
]

puts 'creating Category'
CATEGORIES_INFO.each do |info|
  c = Category.new(
    name: info[:name],
    picture: info[:picture]
    )
  c.save
end

SELLERS_INFO.each do |info|
  puts "creating Seller #{info[:name]}"
  s = Seller.new(
    name: info[:name],
    location: info[:location],
    description: info[:description]
    )

  s.save
  puts 'creating Item'
  samplei = ITEMS_INFO.sample
    i = Item.new(
      seller: s,
      name: samplei[:name],
      description:samplei[:description],
      calories: samplei[:calories],
      proteins: samplei[:proteins],
      fats: samplei[:fats],
      carbs: samplei[:carbs],
      origin: samplei[:origin],
      price: samplei[:price]
      )
    i.save
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
    email: "#{name}@gmail.com",
    password:'123123'
    )
  u.save
  puts 'creating Order'
  o = Order.new(
    user: u
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
