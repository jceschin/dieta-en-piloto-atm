class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items
  enum status: [:pending, :finished]
  has_many :items, through: :order_items

  # scope :pending_order, -> { where(status: "pending") }
end
