class DailyTarget < ApplicationRecord
  belongs_to :user
  validates :caloric_target, presence: true
  validates :protein_target, presence: true
  validates :carb_target, presence: true
  validates :fat_target, presence: true
end
