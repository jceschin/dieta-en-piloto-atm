class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @category = Category.find(params[:id])
    authorize @category
    @items = @category.items
    @order_item = OrderItem.new
  end
end
