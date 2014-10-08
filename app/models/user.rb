class User < ActiveRecord::Base

	has_secure_password

	has_many :affiliations
	has_many :courses, :through => :affiliations 

	## validations go here
	## regex, only letters in name?
	## regex on email?
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: {minimum: 3}, on: :create

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
