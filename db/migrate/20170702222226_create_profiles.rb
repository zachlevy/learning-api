class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.jsonb :demographic, default: {}
      t.jsonb :preferences, default: {}
      t.jsonb :details, default: {}
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
