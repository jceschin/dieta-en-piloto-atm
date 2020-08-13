class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @order_item = OrderItem.new
    @categories = Category.all

    @order = current_user.pending_order
  end
end
