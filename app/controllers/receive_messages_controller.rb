class ReceiveMessagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

	before_action :find_user

## moving to replies controller

	def index
		# mapped this action to http://localhost:3000/sms
		# POST 'sms' in the routes.rb file

		## assign info on user who sends it in
		message_body = params["Body"]
		## accept body of texted reply
		from_number = params["From"]
		## need to use this From to find the user_id of who sent it
		## if the sender is not a user of the app, the reply won't be accepted
		sms_user = User.find_by_sms_phone_number(from_number)
		
		## determine the most recently sent poll
		## if successful proceed
		#@poll = Poll.order(:time_sent).last
		@poll = Poll.where(is_open: true).order(:time_sent).last
		binding.pry
		if @poll && sms_user
			## and info on poll -- what poll is open?
			## for testing
			#@poll = Poll.find_by_id(17)

			@reply = Reply.new
			@reply.response = message_body
			@reply.from_number = from_number
			@reply.poll_id = @poll.id
			@reply.user_id = sms_user.id		
			@poll.replies << @reply

			@reply.save
				
			render :nothing => true, :status => 200, :content_type => 'text/html'
		else
		## if a poll/user wasn't found, then they're not replying about anything
		## just ignore for now, Twilio will log it?
			render :nothing => true, :status => 200, :content_type => 'text/html'
		end
	end

	private

		def find_user
			@user = User.find_by_id(params[:user_id])
		end

end
