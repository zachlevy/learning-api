class CourseContent < ApplicationRecord
  belongs_to :course
  belongs_to :content
end
