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

class Definition < ApplicationRecord
end
