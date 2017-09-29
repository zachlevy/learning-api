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

require 'rails_helper'

RSpec.describe ChallengeResponse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
