class AddCourseToChallengeResponse < ActiveRecord::Migration[5.1]
  def change
    add_reference :challenge_responses, :course, foreign_key: true
  end
end
