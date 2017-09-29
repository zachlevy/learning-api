# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  demographic       :jsonb
#  preferences       :jsonb
#  details           :jsonb
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  anonymous_user_id :integer
#

require 'rails_helper'

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
