class AddEstDurationToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :est_duration, :integer
  end
end
