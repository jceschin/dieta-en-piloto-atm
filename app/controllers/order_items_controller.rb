class OrderItemsController < ApplicationController

  def create
    if !current_user.pending_order.nil?
      order = current_user.pending_order
    else
      order = Order.create(user_id: current_user.id, status: :pending)
    end
    item = Item.find(params[:item_id])
    params[:quantity].to_i.times do
      @order_item = OrderItem.new
      @order_item.item = item
      @order_item.order = order
      @order_item.save
    end
    authorize @order_item

    # render 'items/index'
  end

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_items_params)
    authorize order_item
  end

  private

  def order_items_params
    params.require(:order_item).permit(:consumed_at)
  end
end
