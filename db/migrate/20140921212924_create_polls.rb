class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :topic
      t.string :user_id

      t.timestamps
    end
  end
end
