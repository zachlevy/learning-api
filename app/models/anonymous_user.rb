# == Schema Information
#
# Table name: anonymous_users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnonymousUser < ApplicationRecord
  has_many :challenge_responses
  has_one :profile

  after_create :create_profile

  def create_profile
    Profile.create(anonymous_user: self)
  end
end
