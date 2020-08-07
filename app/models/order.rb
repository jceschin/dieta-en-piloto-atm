class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items
  enum status: [:pending, :finished]
  accepts_nested_attributes_for :order_items
end
