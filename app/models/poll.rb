class Poll < ActiveRecord::Base

	belongs_to :user
	has_many :replies, dependent: :destroy

	validates :topic, :presence => true

end
