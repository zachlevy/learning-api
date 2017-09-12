class AddUserToChallengeResponse < ActiveRecord::Migration[5.1]
  def change
    add_reference :challenge_responses, :user, foreign_key: true
  end
end
