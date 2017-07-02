# == Schema Information
#
# Table name: contents
#
#  id           :integer          not null, primary key
#  title        :string
#  embed_url    :string
#  est_duration :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :content do
    title "MyString"
    embed_url "MyString"
    est_duration 1
  end
end
