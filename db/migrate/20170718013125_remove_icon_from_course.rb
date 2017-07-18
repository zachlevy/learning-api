class RemoveIconFromCourse < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :icon
  end
end
