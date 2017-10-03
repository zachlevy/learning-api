class AddStatusToChallengeResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_responses, :status, :string
  end
end
