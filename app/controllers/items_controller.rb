class ItemsController < ApplicationController
  def index
    @dailytarget = DailyTarget.where(user_id:current_user.id)
    @items = policy_scope(Item)
    @categories = Category.all
  end

  def show
  end
end
