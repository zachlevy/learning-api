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

FactoryGirl.define do
  factory :challenge_response do
    input ""
    asked_at "2017-07-01 19:42:59"
    completed_at "2017-07-01 19:42:59"
    challenge nil
    user nil
  end
end
