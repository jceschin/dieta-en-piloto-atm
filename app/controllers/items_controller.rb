class ItemsController < ApplicationController
  def index
    @dailytarget = DailyTarget.where(user_id:current_user.id).last
    set_suggested_items
    @items = policy_scope(Item)
    @order_item = OrderItem.new
    @categories = Category.all

    @order = current_user.pending_order
  end

  def new
    @user_item = Item.new
    @items_to_select_from = Item.all
    authorize @user_item
  end

  def create
    @user_item = Item.new(user_item_params)
    @user_item.seller_id = Seller.find_by(description:current_user.email).id
    authorize @user_item
    if @user_item.save
      user_item_order_i
      redirect_to daily_target_path(current_user.daily_targets.last.id)
    else
      raise
      render :new
    end
  end

  private

  def user_item_order_i
    o = Order.new(user_id:current_user.id)
    o.save
    oi = OrderItem.new(item_id:@user_item.id, order_id:o.id)
    oi.save
  end

  def user_item_params
    params.require(:item).permit(:name, :calories, :proteins, :fats, :carbs)
  end

  def order_item_params
    params.require(:order_item).permit(:consumed_at)
  end

  def set_suggested_items
    @suggested_items = []
    policy_scope(Item).each do |item|
      if Seller.find_by_id(item.seller_id).name != 'user'
        if calories_in_target?(item) && proteins_in_target?(item) && carbs_in_target?(item) && fats_in_target?(item)
          @suggested_items << item
        end
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
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @cal_left = @daily_target.caloric_target
    orders.each do |order|
      order.order_items.each do |item|
        if item.consumed_at.day == Time.zone.now.day && item.consumed_at.month == Time.zone.now.month && item.consumed_at.year == Time.zone.now.year
          @cal_left -= Item.find_by_id(item.item_id).calories
        end
      end
    end
    @cal_left
  end

  def proteins_left
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @proteins_left = @daily_target.protein_target
    orders.each do |order|
      order.order_items.each do |item|
        if item.consumed_at.day == Time.zone.now.day && item.consumed_at.month == Time.zone.now.month && item.consumed_at.year == Time.zone.now.year
          @proteins_left -= Item.find_by_id(item.item_id).proteins
        end
      end
    end
    @proteins_left
  end

  def carbs_left
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @carbs_left = @daily_target.carb_target
    orders.each do |order|
      order.order_items.each do |item|
        if item.consumed_at.day == Time.zone.now.day && item.consumed_at.month == Time.zone.now.month && item.consumed_at.year == Time.zone.now.year
          @carbs_left -= Item.find_by_id(item.item_id).carbs
        end
      end
    end
    @carbs_left
  end

  def fats_left
    orders = Order.where(user_id:current_user.id)
    @daily_target = DailyTarget.find_by(user_id: current_user.id)
    @fats_left = @daily_target.fat_target
    orders.each do |order|
      order.order_items.each do |item|
        if item.consumed_at.day == Time.zone.now.day && item.consumed_at.month == Time.zone.now.month && item.consumed_at.year == Time.zone.now.year
          @fats_left -= Item.find_by_id(item.item_id).fats
        end
      end
    end
    @fats_left
  end
end
