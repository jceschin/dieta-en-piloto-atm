class AddColumnToDailyTargets < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_targets , :control_limit, :integer
  end
end
