class ChangeOrdersStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :status, 'integer USING CAST(status AS integer)'
  end
end
