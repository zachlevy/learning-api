class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 8..20 }

  has_many :challenge_responses

end
