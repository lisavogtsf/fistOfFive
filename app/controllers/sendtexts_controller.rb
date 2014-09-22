class SendtextsController < ApplicationController

	# necessary??
	def index
	end

	def send_text_message
		# initially set up to receive a destination number through a form post
		# number_to_send_to = params[:number_to_send_to]
		@user = User.find(params[:user])
		@poll = Poll.find_by_id(params[:id])
		message_content = @poll.topic
		message_template = "Please reply with feedback on: "
		message_scale = " (scale of 0-5)"

		number_to_send_to = "4159671051"
		# list_of_numbers = {
		# 	num1: "4159671051",
		# 	num2: "4158465918"
		# }

		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']

		@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
		@twilio_client.account.sms.messages.create(
			:from => "+1#{twilio_phone_number}",
			:to => "+1#{number_to_send_to}",
			:body => message_template + message_content + message_scale
			)

		redirect_to user_path(@user.id)

		# redirect_to user_poll_path(@user.id, @poll.id), :notice => "message sent"
	end


end
