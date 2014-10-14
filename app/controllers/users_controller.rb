class UsersController < ApplicationController

	before_action :find_user, :except => [:index, :new, :create]
	before_action :is_authenticated?, :except => [:new, :create]
	before_action :correct_user?, :except =>[:index, :new, :create]


	def index
		## ok if not current user
		@users = User.all
	end

	def show
		## validate that this is the correct user to see this User Home page
		if correct_user?
			@polls = @user.polls
			@courses = @user.courses
			## access via @poll.replies
		else
			## blocking too easily again 
			binding.pry
			redirect_to user_path(@current_user.id), :notice => "You are not authorized to view this user's page"
		end
	end

	def new
		## this is the signup route, don't need current user check
		## if user is logged in, don't want them to sign up
		if session[:user_id] != nil
			redirect_to user_path(session[:user_id] )
		else
			@user = User.new
		end
	end

	def create
		if session[:user_id] == nil
			@user = User.new(user_params)
			if @user.save # user saved successfully
				auth_user = User.authenticate(@user.email, @user.password)
				# reformat sms number to be seven-digit string
				@user.sms_phone_number = @user.sms_phone_number.gsub(/\D/, '')
				@user.save
				if auth_user
					session[:user_id] = @user.id
					# alert admin about new signup
					sms_user_alert("New user created on Fist of Five website: ")
					redirect_to user_path(@user.id), :notice => "Signed up!"
				end
			else # user not saved successfully?
				if User.find_by_email(@user.email)
					redirect_to signup_path, :notice => 'An account with that email already exists'
				elsif @user.password && @user.password.length < 4
					redirect_to signup_path, :notice => "Password must be at least four characters"
				elsif @user.password != @user.password_confirmation
					redirect_to signup_path, :notice => "Password must match password confirmation"
				# add validation for email format
				elsif @user.sms_phone_number == ""
					redirect_to signup_path, :notice => "Please enter a phone number to receive SMS text messages"
				# add validation for seven-digit number
				else
					flash[:error] = @user.errors.full_messages.to_sentence
						
				end
			end	
		else
			#someone is already logged in and trying to signup, not allowed
			session[:user_id] = nil
			redirect_to login_path, :notice => "Please log in again"
		end
	end

	# only the user should be able to edit their own account
	def edit
	end

	def update
		@user.update_attributes(user_params)
		redirect_to user_path, :notice => "Profile updated"
	end

	# only the user should be able to destroy their own account
	def destroy
		sms_user_alert("User deleted: ")
		@user.destroy
		session[:user_id] = nil
		redirect_to root_path, :notice => "Profile deleted"
	end


	private

		def find_user
			@user = User.find(params[:id])
			## allows only the user to see this??
			redirect_to root_path unless @user
		end

		def user_params
			params.require(:user).permit(:first_name, :last_name, :sms_phone_number, :email, :password, :password_confirmation)
		end

		def correct_user?
			@user = User.find(params[:id])
			@current_user ||= User.find_by(id: session[:user_id])
			## returns result of this comparison
			@user == @current_user
		end

		def sms_user_alert (message_content)
			formatted_num = [ENV['ADMIN_NUMBER']]
			user_email = @user.email
			# message_content = "New user created or deleted"
			message_site = " http://fistof5.herokuapp.com"

			twilio_sid = ENV['TWILIO_ACCOUNT_SID']
			twilio_token = ENV['TWILIO_AUTH_TOKEN']
			twilio_phone_number = ENV['TWILIO_NUMBER']

			@twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

			@twilio_client.account.sms.messages.create(
			:from => "+1#{twilio_phone_number}",
			:to => "+1#{formatted_num}",
			:body => message_content + user_email + message_site
			)
		end

end
