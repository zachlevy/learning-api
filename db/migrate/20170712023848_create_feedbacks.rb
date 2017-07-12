class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.jsonb :body, default: {}
      t.string :source

      t.timestamps
    end
  end
end
