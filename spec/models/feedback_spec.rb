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

require 'rails_helper'

RSpec.describe Feedback, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
