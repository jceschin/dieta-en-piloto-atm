class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum status: %i[pending finished]
  has_many :items, through: :order_items

  def total_price
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end

  def total_cal
    total_cal = 0
    items.each do |item|
      total_cal += item.calories
    end
    total_cal
  end

  def total_cal_in_target?
    total_cal <= DailyTarget.find_by(user_id: user.id).caloric_target
  end

  # returns a hash with it's items key as id
  # and the quantity of each as value
  def quantify
    oi_hash = Hash.new(0)
    order_items.each do |o_item|
      oi_hash[o_item.item.id] += 1
    end
    oi_hash
  end

  def items_and_qty
    iq_hash = Hash.new([Item.new, 0])
    quantify.map do |key, value|
      iq_hash[key] = [Item.find(key), value]
    end
    iq_hash
  end
end
