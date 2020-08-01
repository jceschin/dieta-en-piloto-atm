class ItemsController < ApplicationController

  def index
    @items = policy_scope(Item)
  end

  def show
  end
end
