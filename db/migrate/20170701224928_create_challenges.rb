class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :description
      t.references :challenge_type, foreign_key: true
      t.jsonb :body, default: {}

      t.timestamps
    end
  end
end
