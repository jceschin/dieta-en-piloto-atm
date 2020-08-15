class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    authorize @order
  end
end
