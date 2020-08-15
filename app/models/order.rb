class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum status: [:pending, :finished]
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
    daily_target = DailyTarget.find(user_id:user.id)
    if daily_target_nil?
      total_cal == daily_target.caloric_target
    end
  end
end
