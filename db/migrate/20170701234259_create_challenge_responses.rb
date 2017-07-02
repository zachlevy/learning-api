class CreateChallengeResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_responses do |t|
      t.jsonb :input, default: {}
      t.datetime :asked_at
      t.datetime :completed_at
      t.references :challenge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
