class SendtextsController < ApplicationController

	# necessary?
	def index
	end

	def send_text_message

		# need to fix to allow other recipients
		numbers_for_recipients = [ENV['GOOGLE_VOICE_NUMBER']]

		@poll = Poll.find_by_id(params[:id])
		@user = User.find_by_id(@poll.user_id)
		message_content = @poll.topic
		message_template = "Reply with feedback on: "
		message_scale = " (scale of 0-5, with optional question/comment)."
		message_author = " Sent by " + (@user.email)
		message_site = " using http://fistof5.herokuapp.com"

		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']

		@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

		for number_to_send_to in numbers_for_recipients

			formatted_num = number_to_send_to.gsub(/\D/,'')

			@twilio_client.account.sms.messages.create(
				:from => "+1#{twilio_phone_number}",
				:to => "+1#{formatted_num}",
				:body => message_template + message_content + message_scale + message_author + message_site
				)
		end

		## mark poll as sent and open
		@poll.time_sent = Time.now
		@poll.is_open = true

		# redirect_to user_poll_path(@user.id, @poll.id)
		redirect_to user_poll_path(@poll.user_id, @poll.id), :notice => "poll sent, wait for replies then refresh your page"

		# redirect_to user_poll_path(@user.id, @poll.id), :notice => "message sent"
	end

	def send_admin_alert
		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']
	end

end
