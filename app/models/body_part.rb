class BodyPart < ApplicationRecord
  belongs_to :workout
  belongs_to :excercise
end
