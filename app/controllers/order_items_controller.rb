class OrderItemsController < ApplicationController
  def create
    if !current_user.pending_order.nil?
      order = current_user.pending_order
    else
      order = Order.create(user_id: current_user.id, status: :pending)
    end

    if params[:order_item][:consumed_at].to_i == 1
      qty_consumed = params[:quantity_consumed].to_i
    else
      qty_consumed = 0
    end

    item = Item.find(params[:item_id])
    params[:quantity].to_i.times do
      @order_item = OrderItem.new
      @order_item.item = item
      @order_item.order = order
      if qty_consumed.positive?
        qty_consumed -= 1
        @order_item.consumed_at = Time.zone.now
      end
      @order_item.save!
    end
    authorize @order_item

    redirect_to items_path
  end

  # private

  # def order_item_params
  #   params.require(:order_item).permit(:item_id)
  # end
end
