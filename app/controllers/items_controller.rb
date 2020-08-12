class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @order_item = OrderItem.new
    @categories = Category.all
  end
end
