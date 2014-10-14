class AddOptOutToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :opt_out, :boolean
  end
end
