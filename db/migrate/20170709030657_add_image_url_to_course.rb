class AddImageUrlToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :image_url, :string
  end
end
