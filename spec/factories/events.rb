# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  relations  :jsonb
#  context    :jsonb
#  meta       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :event do
    relations ""
    context ""
    meta ""
  end
end
