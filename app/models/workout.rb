class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :workout_type
  has_many :exercises
  has_many :body_parts, through: :exercises
  has_many :exercise_sets, through: :exercises
end
