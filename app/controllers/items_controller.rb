class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @categories = Category.all

    @order = current_user.pending_order
  end

  def show
  end
end
