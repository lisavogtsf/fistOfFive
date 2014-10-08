class Affiliation < ActiveRecord::Base

	belongs_to :user
	belongs_to :course

	validates :user_id, presence: true # make sure that user exists?
	validates :course_id, presence: true # make sure that course exists?

end
