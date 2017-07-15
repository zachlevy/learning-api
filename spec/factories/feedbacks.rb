# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  body       :jsonb
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :feedback do
    body ""
    source "MyString"
  end
end
