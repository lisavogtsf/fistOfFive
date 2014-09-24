class UsersController < ApplicationController

	before_action :find_user, :except => [:index, :new, :create]
	before_action :is_authenticated?, :except => [:new, :create]
	before_action :correct_user?, :except =>[:index, :new, :create]


	def index
		## ok if not current user
		@users = User.all
	end

	def show
		## validate that this is the correct user
		if correct_user?
			@polls = @user.polls
			## access via @poll.replies
		else
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
			if @user.save
				auth_user = User.authenticate(@user.email, @user.password)
				if auth_user
					session[:user_id] = @user.id
					redirect_to user_path(@user.id), :notice => "Signed up!"
				end
			else
				if User.find_by_email(@user.email)
					redirect_to signup_path, :notice => 'An account with that email already exists'
				elsif
					@user.password.length < 4
					redirect_to signup_path, :notice => "Password must be at least four characters"
				elsif @user.password != @user.password_confirmation
					redirect_to signup_path, :notice => "Password must match password confirmation"
				end
			end	
		else
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
			params.require(:user).permit(:first_name, :last_name, :type, :email, :password, :password_confirmation)
		end

		def correct_user?
			@user = User.find(params[:id])
			@current_user ||= User.find_by(id: session[:user_id])
			## returns result of this comparison
			@user == @current_user
		end

end
