class RemovePictureFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :picture, :string
  end
end
