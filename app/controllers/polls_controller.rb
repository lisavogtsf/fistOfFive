class PollsController < ApplicationController

	## unclear on use of below
	before_action :find_user
	before_action :find_user_poll, :except => [:index, :new, :create]

	# automatically supplies @user and @poll to all actions

	def index
		#@user #= User.find_by_id(params[:user_id])
		@polls = @user.polls
	end

	def show
	end

	def new
		@poll = Poll.new
	end

	def create
		poll = Poll.new(poll_params)
		if poll.save && @user
			@user.polls << poll 
			redirect_to user_polls_path(@user.id)
		else
			flash[:error] = poll.errors.full_messages.to_sentence
			redirect_to user_path @user.id
		end
	end

	def update
		if @poll.update_attributes(poll_params)
			redirect_to user_polls_path(@user)
		else
			redirect_to user_poll_path @user.id, @poll.id
		end
	end

	def destroy
		@poll.destroy
		redirect_to user_polls_path @user.id
	end

private
	## not working well, always redirects to users?
	def find_user
		user_id = params[:user_id]
		@user = User.find_by_id(user_id)
		# redirect_to users_path unless @user
	end

	## Don't really understand this
	def find_user_poll
		id = params[:id]
		@poll = Poll.find_by_id(id)
		# redirect_to user_polls_path(@user.id) unless @poll
	end

	def poll_params
		params.require(:poll). permit(:topic)
	end
end
