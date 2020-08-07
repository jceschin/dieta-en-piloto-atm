class OrdersController < ApplicationController
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    # Redirect to index. Mostrar flash message si no se guardo (o en ambos)
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status, :location, order_items_attributes: %i[item_id consumed_at])
  end
end
