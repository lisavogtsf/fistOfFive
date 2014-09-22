class ReceiveMessagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

	def index

		# let's pretend that we've mapped this action to 
		# http://localhost:3000/sms in the routes.rb file

		message_body = params["Body"]
		from_number = params["From"]

		SMSLogger.log_text_message from_number, message_body
				binding.pry
		## next need to create a result from this
	end

end
