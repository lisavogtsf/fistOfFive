class Course < ActiveRecord::Base

	has_many :affiliations, dependent: :destroy
	has_many :users, :through => :affiliations
	has_many :polls, dependent: :destroy

	validates :title, presence: true

end
