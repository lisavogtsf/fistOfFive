class User < ActiveRecord::Base

	has_secure_password

	has_many :polls, dependent: :destroy
	has_many :replies
	has_many :affiliations, dependent: :destroy
	has_many :courses, :through => :affiliations 

	## validations go here
	# name validations still need to be handled in users_controller to avoid app_killing errors
	#validates :first_name, presence: true
	#validates :last_name, presence: true
	## regex on email, sms_phone_number format
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: {minimum: 6}, on: :create
	validates :sms_phone_number, presence: true

	## need to learn about Rails single table inheritance
	## uses type, but then need to create child classes
	## for student, teacher, admin etc

	def self.authenticate email, password 
		User.find_by_email(email).try(:authenticate, password)
	end

	## set password reset goes here
	# def set_password_reset
	# 	self.code = SecureRandom.urlsafe_base64
	# 	self.expires_at = 4.hours.from_now
	# 	self.save!
	# end

end
