class CreateDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :definitions do |t|
      t.jsonb :body, default: {}
      t.string :word
      t.jsonb :definitions, default: []

      t.timestamps
    end
  end
end
