# == Schema Information
#
# Table name: definitions
#
#  id          :integer          not null, primary key
#  body        :jsonb
#  word        :string
#  definitions :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :definition do
    body ""
    word "MyString"
    definitions ""
  end
end
