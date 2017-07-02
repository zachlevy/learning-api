# == Schema Information
#
# Table name: challenge_responses
#
#  id           :integer          not null, primary key
#  input        :jsonb
#  asked_at     :datetime
#  completed_at :datetime
#  challenge_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ChallengeResponse < ApplicationRecord
  belongs_to :challenge
  belongs_to :user
end
