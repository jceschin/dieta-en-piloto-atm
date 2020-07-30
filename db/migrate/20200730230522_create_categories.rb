class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.char :name

      t.timestamps
    end
  end
end
