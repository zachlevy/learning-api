# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  name        :string
#  slug        :string
#  flow        :jsonb
#  description :text
#  body        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Collection < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
end
