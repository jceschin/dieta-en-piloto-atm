class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    # @order = Order.new(order_params)
    @order = current_user.pending_order
    @order.status = :finished
    if @order.save
      redirect_to order_path(@order)
    # else
      # render 'items'
    end

    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:id)
  end
end
