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

FactoryGirl.define do
  factory :challenge do
    description "MyString"
    challenge_type nil
    body ""
  end
end
