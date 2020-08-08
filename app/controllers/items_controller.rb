class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    @categories = Category.all
  end

  def show
  end
end
