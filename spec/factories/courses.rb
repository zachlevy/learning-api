# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flow         :jsonb            not null
#  tags         :jsonb
#  image_url    :string
#  est_duration :integer
#

FactoryGirl.define do
  factory :course do
    title "MyString"
    description "MyText"
    flow ""
    tags ""
  end
end
