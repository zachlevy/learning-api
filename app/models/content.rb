# == Schema Information
#
# Table name: contents
#
#  id           :integer          not null, primary key
#  title        :string
#  embed_url    :string
#  est_duration :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Content < ApplicationRecord
end
