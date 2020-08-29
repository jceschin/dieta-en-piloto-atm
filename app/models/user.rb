class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :daily_target
  has_one_attached :photo

  def pending_order
    orders.pending.last
  end

  # def daily_target
  # DailyTarget.find_by(user_id: id)
  # end

  # def orders
  # Order.where(user_id: id)
  # end

  def daily_target_upper_limit
    "1.#{daily_target.control_limit}".to_f
  end

  def daily_target_lower_limit
    (1 - "0.#{daily_target.control_limit}".to_f)
  end

  def cal_left
    cal_left = daily_target.caloric_target
    orders.each do |order|
      order.order_items.each do |item|
        cal_left -= Item.find_by_id(item.item_id).calories if item.consumed_at&.today?
      end
    end
    cal_left
  end

  def proteins_left
    proteins_left = daily_target.protein_target
    orders.each do |order|
      order.order_items.each do |item|
        proteins_left -= Item.find_by_id(item.item_id).proteins if item.consumed_at&.today?
      end
    end
    proteins_left
  end

  def carbs_left
    carbs_left = daily_target.carb_target
    orders.each do |order|
      order.order_items.each do |item|
        carbs_left -= Item.find_by_id(item.item_id).carbs if item.consumed_at&.today?
      end
    end
    carbs_left
  end

  def fats_left
    fats_left = daily_target.fat_target
    orders.each do |order|
      order.order_items.each do |item|
        fats_left -= Item.find_by_id(item.item_id).fats if item.consumed_at&.today?
      end
    end
    fats_left
  end

  # def consumed(target_name)
    # acive record
  # end

  # info formated for navbar targets
  def target_info
    [
      {
        title: "Calorías:",
        consumed: daily_target.caloric_target - no_negative(cal_left),
        total: daily_target.caloric_target,
        units: "Kcal"
      },
      {
        title: "Proteinas:",
        consumed: daily_target.protein_target - no_negative(proteins_left),
        total: daily_target.protein_target,
        units: "g"
      },
      {
        title: "Carbs.:",
        consumed: daily_target.carb_target - no_negative(carbs_left),
        total: daily_target.carb_target,
        units: "g"
      },
      {
        title: "Grasas:",
        consumed: daily_target.fat_target - no_negative(fats_left),
        total: daily_target.fat_target,
        units: "g"
      }
    ]
  end

  def no_negative(number)
    number.negative? ? 0 : number
  end
end
