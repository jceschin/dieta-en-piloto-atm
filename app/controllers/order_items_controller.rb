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

  # Para el tracking
  def edit
    @order_item = OrderItem.find(params[:id])
    authorize @order_item
    @item = Item.find_by(id:@order_item.item_id)
  end

  # Para el tracking
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to daily_target_path(current_user.daily_target.id)
    authorize @order_item
  end

  # Para el tracking
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.delete
    authorize @order_item
    redirect_to daily_target_path(current_user.daily_target.id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:consumed_at)
  end
end
