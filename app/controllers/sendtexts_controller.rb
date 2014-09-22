class SendtextsController < ApplicationController

	# necessary??
	def index
	end

	def send_text_message
		# initially set up to receive a destination number through a form post
		# number_to_send_to = params[:number_to_send_to]

		number_to_send_to = "4159671051"

		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']

		message_content = "Yo!"

		@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

		@twilio_client.account.sms.messages.create(
			:from => "+1#{twilio_phone_number}",
			:to => "+1#{number_to_send_to}",
			:body => message_content
			)

		@user = User.find(params[:user])
		redirect_to user_path(@user.id)

		# really wanted to send to the poll#show page,
		# can't get a poll.id to pass in
		# @poll = Poll.find_by_id(params[:id])
		# redirect_to user_poll_path(@user.id, @poll.id), :notice => "message sent"
	end


end
