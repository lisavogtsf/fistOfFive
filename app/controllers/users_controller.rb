class UsersController < ApplicationController

	before_action :is_authenticated?
	before_action :find_user, :except => [:index, :new, :create]

	def index
		@users = User.all
	end

	def show
		@polls = @user.polls
		## add @ results??
	end

	def new
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


	private

		def find_user
			@user = User.find(params[:id])
			## allows only the user to see this??
			redirect_to root_path unless @user
		end

		def user_params
			params.require(:user).permit(:type, :email, :password, :password_confirmation)
		end

end
