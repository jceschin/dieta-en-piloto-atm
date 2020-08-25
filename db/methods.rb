# methods.rb

# Deletes all table data in db
def reset_data
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
end

# ver con metodo constantize
# ej:
# "User".constantize.new

# def creating(array)
#   array.each do |info|
#     puts "--creating #{info[:name]}"
#     ????.create!(
#       name: info[:name]
#       # yield
#       )
#   end
# end


# categories_seeds = {
#   class_name: "Category",
#   attributes: [
#     { name: "pasta" },
#     { name: "pollo" }
#   ]
# }
# ​
# def create_stuff(hash)
#   klass = hash[:class_name].constantize
#   hash[:attributes].each do |instance_attrs|
#     klass.create!(instance_attrs)
#   end
# end

