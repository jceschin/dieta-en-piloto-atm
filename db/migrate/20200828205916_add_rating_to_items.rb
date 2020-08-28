class AddRatingToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :rating, :float
  end
end
