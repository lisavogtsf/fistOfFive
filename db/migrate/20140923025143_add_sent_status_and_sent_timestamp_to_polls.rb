class AddSentStatusAndSentTimestampToPolls < ActiveRecord::Migration
  def change
  	add_column :polls, :is_open, :boolean
  	add_column :polls, :time_sent, :datetime
  end
end
