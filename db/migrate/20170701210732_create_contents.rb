class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :embed_url
      t.integer :est_duration

      t.timestamps
    end
  end
end
