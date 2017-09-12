class RemoveUserFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_reference :profiles, :user, foreign_key: true
  end
end
