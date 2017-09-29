class Collection < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
end
