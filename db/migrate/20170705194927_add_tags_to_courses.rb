class AddTagsToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :tags, :jsonb, default: []
  end
end
