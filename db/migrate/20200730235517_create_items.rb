class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :seller, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :calories
      t.integer :proteins
      t.integer :fats
      t.integer :carbs
      t.string :origin
      t.integer :price

      t.timestamps
    end
  end
end
