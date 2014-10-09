class AddCourseIdToPollsTable < ActiveRecord::Migration
  def change
  	add_column :polls, :course_id, :integer
  end
end
