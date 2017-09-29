# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 8..20 }

  has_many :challenge_responses
  has_one :profile

  after_create :create_profile

  def create_profile
    Profile.create(user: self)
  end
end
