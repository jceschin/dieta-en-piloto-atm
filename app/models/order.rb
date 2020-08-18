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
end
