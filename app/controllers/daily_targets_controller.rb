class DailyTargetsController < ApplicationController
  before_action :set_daily_target, only: %i[edit update]

  def new
    @daily_target = DailyTarget.new
    authorize @daily_target
  end

  def create
    @daily_target = DailyTarget.new(daily_target_params)
    @daily_target.user = current_user
    authorize @daily_target

    if @daily_target.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @daily_target = DailyTarget.find(params[:id])
    authorize @daily_target
    cal_left(@daily_target)
    proteins_left(@daily_target)
    carbs_left(@daily_target)
    fats_left(@daily_target)
    consumed_today
  end

  def edit
    authorize @daily_target
  end

  def update
    @daily_target.update(daily_target_params)
    redirect_to daily_target_path(current_user.daily_target.id)
    authorize @daily_target
  end

  private

  def set_daily_target
    @daily_target = DailyTarget.find(params[:id])
  end

  def daily_target_params
    params.require(:daily_target).permit(:caloric_target, :protein_target, :carb_target, :fat_target, :control_limit)
  end

  def cal_left(daily_target)
    orders = Order.where(user_id: current_user.id, status: :finished)
    @cal_left = daily_target.caloric_target
    orders.each do |order|
      order.order_items.each do |item|
        @cal_left -= Item.find_by_id(item.item_id).calories if item.consumed_at&.today?
      end
    end
  end

  def proteins_left(daily_target)
    orders = Order.where(user_id: current_user.id, status: :finished)
    @proteins_left = daily_target.protein_target
    orders.each do |order|
      order.order_items.each do |item|
        @proteins_left -= Item.find_by_id(item.item_id).proteins if item.consumed_at&.today?
      end
    end
  end

  def carbs_left(daily_target)
    orders = Order.where(user_id: current_user.id, status: :finished)
    @carbs_left = daily_target.carb_target
    orders.each do |order|
      order.order_items.each do |item|
        @carbs_left -= Item.find_by_id(item.item_id).carbs if item.consumed_at&.today?
      end
    end
  end

  def fats_left(daily_target)
    orders = Order.where(user_id: current_user.id, status: :finished)
    @fats_left = daily_target.fat_target
    orders.each do |order|
      order.order_items.each do |item|
        @fats_left -= Item.find_by_id(item.item_id).fats if item.consumed_at&.today?
      end
    end
  end

  def consumed_today
    @items_consumed_today = []
    Order.where(user_id: current_user.id, status: :finished).each do |order|
      order.order_items.each do |order_item|
        @items_consumed_today << Item.find_by_id(order_item.item_id) if order_item.consumed_at&.today?
      end
    end
  end
end

#####
# Items_consumed_today deberia ser una coleccion de order_items y no de items.
