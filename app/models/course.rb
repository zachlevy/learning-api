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
#  ui           :jsonb
#

class Course < ApplicationRecord
  before_save :calculate_est_duration

  def calculate_est_duration
    self.est_duration = self.flow.sum { |c| Challenge.find(c["id"]).body["est_duration"].to_i || 0}
  end
end
