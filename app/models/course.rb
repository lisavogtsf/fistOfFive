class Course < ActiveRecord::Base

	has_many :affiliations
	has_many :users, :through => :affiliations
	has_many :polls

	validates :title, presence: true

end
