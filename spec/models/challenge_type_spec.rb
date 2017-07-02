# == Schema Information
#
# Table name: challenge_types
#
#  id            :integer          not null, primary key
#  name          :string
#  template_data :jsonb
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe ChallengeType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
