class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :poll_id
      t.integer :user_id
      t.string :response

      t.timestamps
    end
  end
end
