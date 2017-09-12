class AddTagsToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :tags, :jsonb, default: []
  end
end
