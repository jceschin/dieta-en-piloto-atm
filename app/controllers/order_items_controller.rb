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

  # private

  # def order_item_params
  #   params.require(:order_item).permit(:item_id)
  # end
end
