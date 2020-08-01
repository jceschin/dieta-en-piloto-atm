class CreateDailyTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_targets do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :caloric_target
      t.integer :protein_target
      t.integer :carb_target
      t.integer :fat_target

      t.timestamps
    end
  end
end
