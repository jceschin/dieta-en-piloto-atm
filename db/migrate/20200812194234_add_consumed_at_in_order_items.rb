class AddConsumedAtInOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :consumed_at, :datetime
  end
end
