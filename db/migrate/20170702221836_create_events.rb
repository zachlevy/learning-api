class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.jsonb :relations, default: {}
      t.jsonb :context, default: {}
      t.jsonb :meta, default: {}

      t.timestamps
    end
  end
end
