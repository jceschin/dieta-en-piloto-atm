class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # pundit
  skip_after_action :verify_authorized, only: :set_items
  after_action :verify_policy_scoped, only: :set_items, unless: :skip_pundit?
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    if current_user
      @dailytarget = DailyTarget.find_by(user_id: current_user.id)
      set_items
    else
      @items = policy_scope(Item).seller
    end

    @order_item = OrderItem.new
    @categories = Category.all
    @order = current_user&.pending_order
  end

  # Para el tracking
  def new
    @item = Item.new
    @items_to_select_from = Item.all
    authorize @item
  end

  # Para el tracking
  def create
    @item = Item.new(item_params)
    @item.seller_id = Seller.find_by(description:current_user.email).id
    @item.origin = "user"
    authorize @item
    if @item.save
      item_order_and_order_items
      redirect_to daily_target_path(current_user.daily_target.id)
    else
      render :new
    end
  end

  # Para el tracking
  def edit
    @item = Item.find(params[:id])
    authorize @item
    @order_item = OrderItem.find_by(item_id:@item)
  end

  # Para el tracking
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to daily_target_path(current_user.daily_target.id)
    authorize @item
  end

  private

  # Para el tracking
  def item_order_and_order_items
    o = Order.where(status: :finished, user_id:current_user.id).last
    if !o.nil? && o.created_at.today?
      @oi = OrderItem.new(item_id:@item.id, order_id:o.id, consumed_at: Time.zone.now)
      @oi.save
    else
      o = Order.new(user_id:current_user.id, status: :finished)
      o.save
      @oi = OrderItem.new(item_id:@item.id, order_id:o.id, consumed_at: Time.zone.now)
      @oi.save
    end
  end

  # Para el tracking
  def item_params
    params.require(:item).permit(:name, :calories, :proteins, :fats, :carbs)
  end

  # Para el tracking
  def order_item_params
    params.require(:order_item).permit(:consumed_at)
  end

  def set_items
    @items = []
    policy_scope(Item).seller.each do |item|
      if calories_in_target?(item) && proteins_in_target?(item) && carbs_in_target?(item) && fats_in_target?(item)
        @items << item
      end
    end
  end

  def calories_in_target?(item)
    item.calories <= cal_left * "1.#{@dailytarget.control_limit}".to_f && item.calories >= cal_left * (1 - "0.#{@dailytarget.control_limit}".to_f)
  end

  def proteins_in_target?(item)
    item.proteins <= proteins_left * "1.#{@dailytarget.control_limit}".to_f && item.proteins >= proteins_left * (1 - "0.#{@dailytarget.control_limit}".to_f)
  end

  def carbs_in_target?(item)
    item.carbs <= carbs_left * "1.#{@dailytarget.control_limit}".to_f && item.carbs >= carbs_left * (1 - "0.#{@dailytarget.control_limit}".to_f)
  end

  def fats_in_target?(item)
    item.fats <= fats_left * "1.#{@dailytarget.control_limit}".to_f && item.fats >= fats_left * (1 - "0.#{@dailytarget.control_limit}".to_f)
  end

  def cal_left
    orders = Order.where(user_id: current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @cal_left = @daily_target.caloric_target
    orders.each do |order|
      order.order_items.each do |item|
        @cal_left -= Item.find_by_id(item.item_id).calories if item.consumed_at&.today?
      end
    end
    @cal_left
  end

  def proteins_left
    orders = Order.where(user_id: current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @proteins_left = @daily_target.protein_target
    orders.each do |order|
      order.order_items.each do |item|
        @proteins_left -= Item.find_by_id(item.item_id).proteins if item.consumed_at&.today?
      end
    end
    @proteins_left
  end

  def carbs_left
    orders = Order.where(user_id: current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @carbs_left = @daily_target.carb_target
    orders.each do |order|
      order.order_items.each do |item|
        @carbs_left -= Item.find_by_id(item.item_id).carbs if item.consumed_at&.today?
      end
    end
    @carbs_left
  end

  def fats_left
    orders = Order.where(user_id: current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @fats_left = @daily_target.fat_target
    orders.each do |order|
      order.order_items.each do |item|
        @fats_left -= Item.find_by_id(item.item_id).fats if item.consumed_at&.today?
      end
    end
    @fats_left
  end
end
