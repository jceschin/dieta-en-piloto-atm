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
    item.calories < @dailytarget.last.caloric_target * 1.2 && item.calories > @dailytarget.last.caloric_target * 0.8
  end

  def proteins_in_target?(item)
    item.proteins < @dailytarget.last.protein_target * 1.2 && item.proteins > @dailytarget.last.protein_target * 0.8
  end

  def carbs_in_target?(item)
    item.carbs < @dailytarget.last.carb_target * 1.2 && item.carbs > @dailytarget.last.carb_target * 0.8
  end

  def fats_in_target?(item)
    item.fats < @dailytarget.last.fat_target * 1.2 && item.fats > @dailytarget.last.fat_target * 0.8
  end
end
