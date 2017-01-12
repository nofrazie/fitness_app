class ExerciseSet < ApplicationRecord
  belongs_to :exercise
  validates :number,  presence: true,
                      uniqueness: true
  validates :reps,    presence: true
  validates :weight,  presence: true
end
