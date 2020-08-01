class DailyTarget < ApplicationRecord
  belongs_to :user
  validates :caloric_target, presence: true
  validates :protein_target, presence: true
  validates :carb_target, presence: true
  validates :fat_target, presence: true

  validates_numericality_of :caloric_target, greater_than: 0
  validates_numericality_of :protein_target, greater_than: 0
  validates_numericality_of :carb_target, greater_than: 0
  validates_numericality_of :fat_target, greater_than: 0
end
