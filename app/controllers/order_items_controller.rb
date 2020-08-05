class OrderItemsController < ApplicationController
  def create
    @order_item = OrderItem.new
    @order_item.user = current_user
    # authorize @order_item
    @order_item.item = Item.find(params[:item_id])

    if @order_item.save
      redirect_to item_path(Item.find(params[:item_id]))
    else
      render "items/show"
    end
  end
end
