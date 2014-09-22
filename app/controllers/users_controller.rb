class UsersController < ApplicationController

	before_action :is_authenticated?, :except => [:new, :create]
	before_action :find_user, :except => [:index, :new, :create]
	before_action :check_current_user


	def index
		## ok if not current user
		@users = User.all
	end

	def show
		if @not_current_user
			redirect_to users_path, :notice => "You are not authorized to view this user's page"
		else
			@polls = @user.polls
			## add @replies for each poll??
			## access via @poll.replies
		end
	end

	def new
		## this is the signup route, don't need current user
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to root_path, :notice => "Signed up!"
		else
			## what's this?
			render "new"
		end
	end

	# def edit
	# end

	# def update
	# end

	# def destroy
	# end


	private

		def find_user
			@user = User.find(params[:id])
			## allows only the user to see this??
			redirect_to root_path unless @user
		end

		def user_params
			params.require(:user).permit(:type, :email, :password, :password_confirmation)
		end

		def check_current_user
			if @user != @current_user
				@not_current_user = true
			else
				@not_current_user = false
			end
		end

end
