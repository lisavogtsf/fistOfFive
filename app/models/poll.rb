class Poll < ActiveRecord::Base

	belongs_to :user
	has_many :replies

	validates :topic, :presence => true

end
