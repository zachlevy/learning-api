class AddIconToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :icon, :string
  end
end
