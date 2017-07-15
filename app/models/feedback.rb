# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  body       :jsonb
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ApplicationRecord
end
