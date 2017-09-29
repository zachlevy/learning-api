class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :slug
      t.jsonb :flow, default: []
      t.text :description
      t.jsonb :body, default: {}

      t.timestamps
    end
    add_index :collections, :slug, unique: true
  end
end
