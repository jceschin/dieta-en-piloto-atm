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

  def edit
    authorize @daily_target
  end

  def update
    @daily_target.update(daily_target_params)
    redirect_to items_path
    authorize @daily_target
  end

  private

  def set_daily_target
    @daily_target = DailyTarget.find(params[:id])
  end

  def daily_target_params
    params.require(:daily_target).permit(:caloric_target, :protein_target, :carb_target, :fat_target, :control_limit)
  end
end
