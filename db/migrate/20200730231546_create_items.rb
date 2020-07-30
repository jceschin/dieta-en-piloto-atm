class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :seller, null: false, foreign_key: true
      t.char :name
      t.text :description
      t.integer :calories
      t.integer :proteins
      t.integer :fats
      t.integer :carbs
      t.char :origin
      t.char :price

      t.timestamps
    end
  end
end
