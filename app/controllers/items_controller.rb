class ItemsController < ApplicationController
  def index
    @dailytarget = DailyTarget.where(user_id:current_user.id)
    set_items
    @categories = Category.all
  end

  def show
  end

  private

  def set_items
    @items_suggested = []
    policy_scope(Item).each do |item|
      if calories_in_target?(item) && proteins_in_target?(item) && carbs_in_target?(item) && fats_in_target?(item)
        @items_suggested << item
      end
    end
  end

  def calories_in_target?(item)
    item.calories <= cal_left * "1.#{@dailytarget.last.control_limit}".to_f && item.calories >= cal_left * (1 - "0.#{@dailytarget.last.control_limit}".to_f)
  end

  def proteins_in_target?(item)
    item.proteins <= proteins_left * "1.#{@dailytarget.last.control_limit}".to_f && item.proteins >= proteins_left * (1 - "0.#{@dailytarget.last.control_limit}".to_f)
  end

  def carbs_in_target?(item)
    item.carbs <= carbs_left * "1.#{@dailytarget.last.control_limit}".to_f && item.carbs >= carbs_left * (1 - "0.#{@dailytarget.last.control_limit}".to_f)
  end

  def fats_in_target?(item)
    item.fats <= fats_left * "1.#{@dailytarget.last.control_limit}".to_f && item.fats >= fats_left * (1 - "0.#{@dailytarget.last.control_limit}".to_f)
  end

  def cal_left
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @cal_left = @daily_target.caloric_target
    orders.each do |order|
      order.order_items.each do |item|
        @cal_left -= Item.find_by_id(item.item_id).calories
      end
    end
    @cal_left
  end

  def proteins_left
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @proteins_left = @daily_target.protein_target
    orders.each do |order|
      order.order_items.each do |item|
        @proteins_left -= Item.find_by_id(item.item_id).proteins
      end
    end
    @proteins_left
  end

  def carbs_left
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @carbs_left = @daily_target.carb_target
    orders.each do |order|
      order.order_items.each do |item|
        @carbs_left -= Item.find_by_id(item.item_id).carbs
      end
    end
    @carbs_left
  end

  def fats_left
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @fats_left = @daily_target.fat_target
    orders.each do |order|
      order.order_items.each do |item|
        @fats_left -= Item.find_by_id(item.item_id).fats
      end
    end
    @fats_left
  end
end
