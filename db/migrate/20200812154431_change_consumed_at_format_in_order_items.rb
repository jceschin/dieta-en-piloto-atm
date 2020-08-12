class ChangeConsumedAtFormatInOrderItems < ActiveRecord::Migration[6.0]
  def change
    change_column :order_items, :consumed_at, :datetime
  end
end
