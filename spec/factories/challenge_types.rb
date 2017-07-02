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

FactoryGirl.define do
  factory :challenge_type do
    name "MyString"
    template_data ""
  end
end
