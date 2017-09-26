class AddAnonymousUserToChallengeResponse < ActiveRecord::Migration[5.1]
  def change
    add_reference :challenge_responses, :anonymous_user, foreign_key: true
  end
end
