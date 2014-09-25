class PollsController < ApplicationController

	## unclear on use of below
	before_action :is_authenticated?
	before_action :find_user
	before_action :find_user_poll
	before_action :correct_user?
	## how do I want to do permissions here?

	# automatically supplies @user and @poll to all actions

	def index
		if correct_user?
			@polls = @user.polls
		else
			## do I want users to see other users' polls? No
			redirect_to user_polls_path(@current_user.id), :notice => "You are not authorized to view this user's polls"
		end
	end

	def show
		if correct_user?
			@poll = find_user_poll
			@replies = @poll.replies

			scale = [0, 1, 2, 3, 4, 5]
			scale_counter = [] # end [3, 5, 19, 4, 5, 4]
			
			for scale_num in scale 
				# for each number in the scale, zero out, then go through replies adding

				scale_counter[scale_num] = 0
				for reply in @replies
					num_reply = reply.response[0].to_i
					
					if num_reply == scale_num
						scale_counter[scale_num] += 1
					end
				end 
			end
			@results = scale_counter

			#percentage results
			@percent_results = @results
			total = 0
			for num in @results 
				num +=
				total = num 
			end
			i = 0
			for per_res in @results
				per_res = (per_res/total)
				@percent_results[i] = per_res
			end
			@percent_results
		else
			redirect_to user_polls_path(@current_user.id), :notice => "You are not authorized to view this user's page"
		end
	end

	def new
		if correct_user?
			@poll = @user.polls.new
			# render new_user_poll_path(@user.id)
		else
			redirect_to user_path(@current_user.id), :notice => "You are not authorized to create a poll in someone else's account"
		end
	end

	def create
		poll = Poll.new(poll_params)
		if poll.save && @user
			poll.is_open = false
			@user.polls << poll 
			redirect_to user_poll_path(@user.id, poll.id), :notice => "Poll created"
		else
			flash[:error] = poll.errors.full_messages.to_sentence
			redirect_to user_path @user.id
		end
	end

	def update
		@poll.update_attributes(poll_params)
		redirect_to user_poll_path @user.id, @poll.id, :notice => "Poll updated"
		# if @poll.update_attributes(poll_params)
		# 	redirect_to user_polls_path(@user)
		# else
		# 	redirect_to user_poll_path @user.id, @poll.id
		# end
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

	def correct_user?
		@user = find_user
		@current_user ||= User.find_by(id: session[:user_id])
		## returns result of this comparison
		@user == @current_user
	end

	def poll_params
		params.require(:poll). permit(:topic, :is_open, :user_id, :time_sent)
	end

end
