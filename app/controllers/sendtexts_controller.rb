class SendtextsController < ApplicationController

	# necessary?
	def index
	end

	def send_text_message

		@poll = Poll.find_by_id(params[:id])
		@user = User.find_by_id(@poll.user_id)
		@course = Course.find_by_id(@poll.course_id)

		## always include admin
		numbers_for_recipients = [ENV['ADMIN_NUMBER']]
		## gather recipients using @course.users but only if they are opt-in
		for recipient in @course.users 
			numbers_for_recipients << recipient.sms_phone_number
		end

		message_content = @poll.topic
		message_template = "Reply with feedback on: "
		message_scale = " (scale of 0-5, with optional question/comment)."
		message_author = " Sent by " + (@user.email) + " using"
		message_site = " http://fistof5.herokuapp.com"
		message_boilerplate = message_template + "\"" + message_content + "\"" + message_scale + message_author + message_site
		message_short = message_template + "\"" +  message_content + "\"" + message_site

		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']

		@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

		for number_to_send_to in numbers_for_recipients

			formatted_num = number_to_send_to.gsub(/\D/,'')
			
			if (message_boilerplate.length < 160)
				@twilio_client.account.sms.messages.create(
					:from => "+1#{twilio_phone_number}",
					:to => "+1#{formatted_num}",
					:body => message_template + "\"" + message_content + "\"" + message_scale + message_author + message_site
					)
			elsif (message_short.length < 160)
					@twilio_client.account.sms.messages.create(
					:from => "+1#{twilio_phone_number}",
					:to => "+1#{formatted_num}",
					:body => message_template + "\"" +  message_content + "\"" + message_site
					)
			else # confirmed in advance that this message is short enough
					@twilio_client.account.sms.messages.create(
					:from => "+1#{twilio_phone_number}",
					:to => "+1#{formatted_num}",
					:body => message_template + message_scale + message_site 
					)
			end
		end

		## mark poll as sent and open
		@poll.time_sent = Time.now
		@poll.is_open = true
		@poll.save

		# redirect_to user_poll_path(@user.id, @poll.id)
		redirect_to user_poll_path(@poll.user_id, @poll.id), :notice => "poll sent, wait for replies then refresh your page"

		# redirect_to user_poll_path(@user.id, @poll.id), :notice => "message sent"
	end

end
