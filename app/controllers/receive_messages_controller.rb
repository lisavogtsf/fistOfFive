class ReceiveMessagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

	def index
		# mapped this action to 
		# http://localhost:3000/sms in the routes.rb file

		message_body = params["Body"]
		from_number = params["From"]
		
		# for testing
		@user = User.find_by_id(6)
		@poll = Poll.find_by_id(4)

		@reply = Reply.new
		@reply.response = message_body
		@reply.save
		# if @reply.save ## skipping error messages
		## for testing purposes, grace poll 4
		# @user = User.find(6)
		# @poll = Poll.find(4)
		# redirect_to user_poll_replies_path(@user.id, @poll.id)
		# post request so needs to be create?
		# redirect_to new_user_poll_reply_path(@poll.id, @user.id)


		## don't really know what next thing is
		# SMSLogger.log_text_message from_number, message_body

		## next need to create a result from this
	end

end
