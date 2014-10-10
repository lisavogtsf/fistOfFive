class AddColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_time_zone, :string
  end
end
