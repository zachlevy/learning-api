class AddUiToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :ui, :jsonb, default: {}
  end
end
