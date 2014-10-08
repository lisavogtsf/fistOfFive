class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :desc
      t.string :schedule

      t.timestamps
    end
  end
end
