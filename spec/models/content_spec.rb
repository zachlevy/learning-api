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

require 'rails_helper'

RSpec.describe Content, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
