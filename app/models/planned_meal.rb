class PlannedMeal < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :date, :meal, presence: true
end
