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
		
		## determine the most recently sent poll
		## if successful proceed
		@poll = Poll.order(:time_sent).last
		if @poll 
			## and info on poll -- what poll is open?
			## for testing
			#@poll = Poll.find_by_id(17)

			@reply = Reply.new
			@reply.response = message_body
			@reply.from_number = from_number
			@reply.poll_id = @poll.id
			@reply.user_id = @poll.user_id		
			@poll.replies << @reply

			@reply.save
				
			render :nothing => true, :status => 200, :content_type => 'text/html'
		## if a poll wasn't found, then they're not replying about anything
		## just ignore for now, Twilio will log it?
		end
	end

	private

		def find_user
			@user = User.find_by_id(params[:user_id])
		end

end
