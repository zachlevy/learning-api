# == Schema Information
#
# Table name: challenges
#
#  id                :integer          not null, primary key
#  description       :string
#  challenge_type_id :integer
#  body              :jsonb
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Challenge < ApplicationRecord
  belongs_to :challenge_type
  has_many :challenge_responses
end
