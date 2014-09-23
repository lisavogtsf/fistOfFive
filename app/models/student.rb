class Student < ActiveRecord::Base

	has_many :replies
	belongs_to :user

	# ask users to enter it as "4153339999"
	# regex validation
	validates :sms_phone_number, :presence => true

end
