class ChangeItemsOrigin < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :origin, 'integer USING CAST(origin AS integer)'
  end
end
