class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # pundit
  skip_after_action :verify_authorized, only: :set_items
  after_action :verify_policy_scoped, only: :set_items, unless: :skip_pundit?
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    if current_user
      set_items
    else
      @items = policy_scope(Item)
    end

    @order_item = OrderItem.new
    @categories = Category.all
    @order = current_user&.pending_order
  end

  private

  def set_items
    @items = []
    daily_target = DailyTarget.where(user_id: current_user.id).last
    policy_scope(Item).each do |item|
      @items << item if nutrients_in_target(item, daily_target)
    end
  end

  def nutrients_in_target(item, daily_target)
    calories_in_target?(item, daily_target) && proteins_in_target?(item, daily_target) && carbs_in_target?(item, daily_target) && fats_in_target?(item, daily_target)
  end

  def calories_in_target?(item, target)
    item.calories <= current_user.cal_left * target.upper_limit && item.calories >= current_user.cal_left * target.lower_limit
  end

  def proteins_in_target?(item, target)
    item.proteins <= current_user.proteins_left * target.upper_limit && item.proteins >= current_user.proteins_left * target.lower_limit
  end

  def carbs_in_target?(item, target)
    item.carbs <= current_user.carbs_left * target.upper_limit && item.carbs >= current_user.carbs_left * target.lower_limit
  end

  def fats_in_target?(item, target)
    item.fats <= current_user.fats_left * target.upper_limit && item.fats >= current_user.fats_left * target_lower.limit
  end
end
