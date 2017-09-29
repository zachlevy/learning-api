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
#  dependencies      :jsonb
#  tags              :jsonb
#

require 'rails_helper'

RSpec.describe Challenge, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
