class OrderItemsController < ApplicationController
  def create
    if !current_user.pending_order.nil?
      order = current_user.pending_order
    else
      order = Order.create(user_id: current_user.id, status: :pending)
    end
    params[:quantity].times do
      @order_item = OrderItem.new(order_item_params)
      @order_item.order = order
      @order_item.save
    end
  end

  def edit
    authorize @order_item
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id)
  end
end
