class RemoveTeachersTable < ActiveRecord::Migration
  def change
  	drop_table :teachers
  end
end
