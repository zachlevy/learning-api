class Content < ApplicationRecord
  has_many :course_contents
  has_many :courses, through: :course_contents
end
