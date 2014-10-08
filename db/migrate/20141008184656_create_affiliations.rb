class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.string :user_id
      t.string :course_id
      t.string :section_id
      t.boolean :sms_opt_out, default: false
      t.string :role

      t.timestamps
    end
  end
end
