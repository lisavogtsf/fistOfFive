class AddFromNumberToReplies < ActiveRecord::Migration
  def change
  	add_column :replies, :from_number, :string
  end
end
