class OrderItemsController < ApplicationController
  def create
    params[:quantity].times do
      @order_item = OrderItem.new(order_item_params)
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id)
  end
end
