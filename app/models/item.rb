class Item < ApplicationRecord
  belongs_to :seller
  has_many :item_categories
  has_many :order_items
  has_many :categories, through: :item_categories
  enum origin: %i[user seller database]

  has_one_attached :picture
end
