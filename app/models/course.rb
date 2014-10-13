class Course < ActiveRecord::Base

	has_many :affiliations
	has_many :users, :through => :affiliations

	validates :title, presence: true

end
