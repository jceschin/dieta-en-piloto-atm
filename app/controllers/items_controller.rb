class ItemsController < ApplicationController
  def index
    dailytargets = DailyTarget.where(user_id:current_user.id)
    @items = policy_scope(Item)
    @items = Item.where("calories<=""#{dailytargets.last.caloric_target}")
    @categories = Category.all
  end

  def show
  end
end
