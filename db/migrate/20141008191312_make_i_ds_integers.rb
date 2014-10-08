class MakeIDsIntegers < ActiveRecord::Migration

  def change
  	change_column :affiliations, :user_id, 'integer USING CAST(user_id AS integer)'
  	change_column :affiliations, :course_id, 'integer USING CAST(user_id AS integer)'
  	remove_column :affiliations, :section_id
  end

end
