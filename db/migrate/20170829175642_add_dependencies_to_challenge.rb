class AddDependenciesToChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :dependencies, :jsonb, default: []
  end
end
