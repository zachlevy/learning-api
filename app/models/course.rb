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
  # before_save :calculate_est_duration # temporarily turn off, make it manual later maybe
  before_save :add_challenge_descriptions_to_flow
  has_many :challenge_responses

  def calculate_est_duration
    self.est_duration = self.flow.sum { |c| Challenge.find(c["id"]).body["est_duration"].to_i || 0}
  end

  def add_challenge_descriptions_to_flow
    # optional descriptions
    unless self.ui["flowDescriptions"] == true
      return
    end
    self.flow.map do |c|
      c["description"] = Challenge.find(c["id"]).description
      c
    end
    self.save
  end
end
