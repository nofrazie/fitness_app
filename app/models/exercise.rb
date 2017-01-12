class Exercise < ApplicationRecord
  belongs_to :workout
  has_and_belongs_to_many :body_parts
  has_many :exercise_sets
  validates :workout_id, presence: true
  validates :name, presence: true, length: { minimum: 2 }
end
