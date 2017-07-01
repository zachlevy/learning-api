class Challenge < ApplicationRecord
  belongs_to :challenge_type
  has_many :challenge_responses
end
