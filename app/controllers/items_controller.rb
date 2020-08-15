class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # pundit
  skip_after_action :verify_authorized, only: :set_items
  after_action :verify_policy_scoped, only: :set_items, unless: :skip_pundit?
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    if current_user
      @dailytarget = DailyTarget.where(user_id: current_user.id).last
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
    policy_scope(Item).each do |item|
      if calories_in_target?(item) && proteins_in_target?(item) && carbs_in_target?(item) && fats_in_target?(item)
        @items << item
      end
    end
  end

  def calories_in_target?(item)
    item.calories <= current_user.cal_left * daily_target_upper_limit && item.calories >= current_user.cal_left * daily_target_lower_limit
  end

  def proteins_in_target?(item)
    item.proteins <= current_user.proteins_left * daily_target_upper_limit && item.proteins >= current_user.proteins_left * daily_target_lower_limit
  end

  def carbs_in_target?(item)
    item.carbs <= current_user.carbs_left * daily_target_upper_limit && item.carbs >= current_user.carbs_left * daily_target_lower_limit
  end

  def fats_in_target?(item)
    item.fats <= current_user.fats_left * daily_target_upper_limit && item.fats >= current_user.fats_left * daily_target_lower_limit
  end
end
