# == Schema Information
#
# Table name: definitions
#
#  id          :integer          not null, primary key
#  body        :jsonb
#  word        :string
#  definitions :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Definition, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
