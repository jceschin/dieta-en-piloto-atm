class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.char :name
      t.char :location
      t.text :description

      t.timestamps
    end
  end
end
