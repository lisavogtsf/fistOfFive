class User < ActiveRecord::Base

	has_secure_password

	## validations go here

	def self.authenticate email, password 
		User.find_by_email(email).try(:authenticate, password)
	end

	## set password reset goes here

end
