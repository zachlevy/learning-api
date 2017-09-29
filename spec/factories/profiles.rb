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

FactoryGirl.define do
  factory :profile do
    demographic ""
    preferences ""
    details ""
    user nil
  end
end
