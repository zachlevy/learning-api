class RemoveUserFromChallengeResponse < ActiveRecord::Migration[5.1]
  def change
    remove_reference :challenge_responses, :user, foreign_key: true
  end
end
