class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items
  enum status: [:pending, :finished]
end
