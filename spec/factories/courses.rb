# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flow        :jsonb            not null
#

FactoryGirl.define do
  factory :course do
    title "MyString"
    description "MyText"
    flow ""
  end
end
