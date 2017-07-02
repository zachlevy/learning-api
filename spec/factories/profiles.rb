# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  demographic :jsonb
#  preferences :jsonb
#  details     :jsonb
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :profile do
    demographic ""
    preferences ""
    details ""
    user nil
  end
end
