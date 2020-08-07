class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @categories = Category.all
    @order = current_user&.pending_order || Order.create
    # Si la order no tiene user, agregar order_id a los cookies
  end

  def show
  end
end
