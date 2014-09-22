class RepliesController < ApplicationController

	before_action :find_user
	before_action :find_user_poll
	# before_action :find_user_poll_reply

	def index
		@replies = @poll.replies
	end

	## no such form
	# def new
	# end

	# def create
	# 	## in receive_messages_controller.rb
	# end

	def show
		@reply = find_user_poll_reply
	end

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

end
