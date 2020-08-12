class RemoveConsumedAtFromOrderItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :consumed_at, :time
  end
end
