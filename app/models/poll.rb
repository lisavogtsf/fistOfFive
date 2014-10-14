class Poll < ActiveRecord::Base

	belongs_to :user
	belongs_to :course
	has_many :replies, dependent: :destroy

	validates :topic, :presence => true
	validates :course, :presence => true

end
