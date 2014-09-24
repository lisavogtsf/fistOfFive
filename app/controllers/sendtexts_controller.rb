class SendtextsController < ApplicationController

	# necessary?
	def index
	end

	def send_text_message

		numbers_for_recipients = ["4159671051", "4158465918"]
		# , "3238068310"

		# @user = User.find(params[:user])
		@poll = Poll.find_by_id(params[:id])
		message_content = @poll.topic
		message_template = "Please reply with feedback on: "
		message_scale = " (scale of 0-5)"

		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']

		@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

		for number_to_send_to in numbers_for_recipients

			@twilio_client.account.sms.messages.create(
				:from => "+1#{twilio_phone_number}",
				:to => "+1#{number_to_send_to}",
				:body => message_template + message_content + message_scale
				)
		end

		## mark poll as sent and open
		@poll.time_sent = Time.now
		@poll.is_open = true
		# redirect_to user_poll_path(@user.id, @poll.id)
		redirect_to user_poll_path(@poll.user_id, @poll.id), :notice => "poll sent"

		# redirect_to user_poll_path(@user.id, @poll.id), :notice => "message sent"
	end


end
