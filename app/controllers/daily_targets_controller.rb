class DailyTargetsController < ApplicationController
  def new
    @daily_target = DailyTarget.new
  end

  def create
    @daily_target = DailyTarget.new(daily_target_params)
    @daily_target.user = current_user
  end

  private

  def daily_target_params
    params.require(:daily_target).permit(:caloric_target, :protein_target, :carb_target, :fat_target)
  end
end
