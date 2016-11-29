class BodyPart < ApplicationRecord
  has_many :compounds
  has_many :exercises, through: :compounds
end
