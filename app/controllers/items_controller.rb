class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @items = policy_scope(Item)
    @order_item = OrderItem.new
    @categories = Category.all

    @order = nil #current_user.pending_order
  end
end
