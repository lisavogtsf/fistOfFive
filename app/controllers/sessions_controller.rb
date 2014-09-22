class SessionsController < ApplicationController

	def new
		# my login form
	end

	def create
		@user = User.authenticate(params[:user][:email],params[:user][:password])
		if @user # if user is authenticated
			session[:user_id] = @user.id
			redirect_to user_path(@user.id), :notice => "You are logged in"
			# redirect_to login_url, :notice => "You have logged in, need to fix as you should not see login now"
		else # if user is not authenticated oncreate
			flash.now[:error] = "Can't log you in"
			# sends back to login form?
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, :notice => "Logged out"
	end


end
