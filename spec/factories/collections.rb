# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  flow        :jsonb
#  description :text
#  body        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :collection do
    name "MyString"
    slug "MyString"
    flow ""
    description "MyText"
    body ""
  end
end
