class User < ActiveRecord::Base

	has_secure_password

	## validations go here

	## need to learn about Rails single table inheritance
	## uses type, but then need to create child classes
	## for student, teacher, admin etc

	def self.authenticate email, password 
		User.find_by_email(email).try(:authenticate, password)
	end

	## set password reset goes here

end
