class AddCoursesToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :courses, :jsonb, default: []
  end
end
