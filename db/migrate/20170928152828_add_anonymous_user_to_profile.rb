class AddAnonymousUserToProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :profiles, :anonymous_user, foreign_key: true
  end
end
