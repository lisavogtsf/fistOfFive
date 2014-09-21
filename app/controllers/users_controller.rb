class UsersController < ApplicationController

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

	def user_params
		params.require(:user).permit(:type, :email, :password, :password_confirmation)
	end

end
