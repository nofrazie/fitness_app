class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :compounds
  has_many :body_parts, through: :compounds
  has_many :exercise_sets
  validates :workout_id, presence: true
  validates :name, presence: true, length: { minimum: 2 }
end
