class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum status: [:pending, :finished]
  has_many :items, through: :order_items

  def total_price
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end
end
