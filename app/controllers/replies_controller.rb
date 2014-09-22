class RepliesController < ApplicationController

	before_action :is_authenticated?
	before_action :find_user
	before_action :find_user_poll
	before_action :find_user_poll_reply
	before_action :correct_user?

	def index
		## looking at replies for the correct user?
		if correct_user?
			@replies = @poll.replies
		else
			redirect_to user_polls_path(@current_user.id), :notice => "You are not authorized to view this user's page"
		end	
	end

	## no such form
	# def new
	# end

	# def create
	# 	## in receive_messages_controller.rb
	# end

	def show
		if correct_user?
			@reply = find_user_poll_reply
		else
			redirect_to user_polls_path(@current_user.id), :notice => "You are not authorized to view this user's poll results"
		end
	end

	## does editing  a reply make sense?
	# def edit
	# end

	# def update
	# end

	# ## how would I use this?
	# def destroy
	# end

	private

		def find_user
			@user = User.find_by_id(params[:user_id])
		end

		def find_user_poll
			@poll = Poll.find_by_id(params[:poll_id])
		end

		def find_user_poll_reply
			@reply = Reply.find_by_id(params[:id])
		end

		def correct_user?
			@user = find_user
			@current_user ||= User.find_by(id: session[:user_id])
			## returns result of this comparison
			@user == @current_user
		end

end
