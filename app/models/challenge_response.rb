# == Schema Information
#
# Table name: challenge_responses
#
#  id                :integer          not null, primary key
#  input             :jsonb
#  asked_at          :datetime
#  completed_at      :datetime
#  challenge_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  course_id         :integer
#  anonymous_user_id :integer
#

class ChallengeResponse < ApplicationRecord
  belongs_to :challenge
  belongs_to :user, required: false
  belongs_to :anonymous_user, required: false
  belongs_to :course
end
