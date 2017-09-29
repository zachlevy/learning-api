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

class Profile < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :anonymous_user, required: false
end
