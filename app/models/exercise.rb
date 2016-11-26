class Exercise < ApplicationRecord
  belongs_to :workout
  has_many :exercise_sets
  has_many :body_parts
end
