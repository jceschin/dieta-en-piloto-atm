class OrderItemsController < ApplicationController
  def create
    params[:quantity].times do
      @order_item = OrderItem.new(order_item_params)
      if (order = current_user.pending_order)
      else
        order = Order.create(user_id: current_user.id, status: :pending)
      end
      @order_item.order == order
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id)
  end
end
