class PollsController < ApplicationController

	before_action :is_authenticated?, except: [:index, :show]
	before_action :is_logged_in? #checks without kicking out
	before_action :correct_user?, except: [:index, :new] #just makes @correct_user true or false
	before_action :find_poll
	before_action :find_poll_owner, except: [:index, :new]
	## automatically supplies @poll, @poll_owner, @current_user, @correct_user to all actions

	def index
		# want to show all polls to everyone, limit what they can do
		# @current_user
		# @correct_user = false 
		@polls = Poll.all
	end

	def show
		#available to all logged in and public
		@correct_user
		@course = Course.find_by_id(@poll.course_id)
		@replies = @poll.replies
		@poll_owner
binding.pry
		## recently added
		@poll_not_sent = true
		if @poll.time_sent
			@poll_not_sent = false
		end

		## begins tabulation for chart
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

		# #percentage results
		# @percent_results = @results
		# # get sum of array known to have +0 items
		# total = @percent_results.inject(:+)
		# i = 0
		# while i < @results.length do
		# 	@percent_results[i] = (@results[i]/total)*100
		# 	i += 1

		# end
		# @percent_results

	end

	def new
		# only logged in users should be able to see this
		@poll = Poll.new
	end

	def create
		poll = Poll.new(poll_params)
		# poll.user_id = @user.id #sending this over as @poll.user_id
		## need to include timezone info from course to correct timestamp
		if poll.save 
			poll.is_open = false
			if poll.course_id
				@user.polls << poll 
				redirect_to user_poll_path(@user.id, poll.id), :notice => "Poll created"
			else 
				# if no course was selected--would prefer better error handling here				
				# redirect_to user_poll_new_path, :alert => "please select a course"
				poll.course_id = 1
				@user.polls << poll 
				redirect_to user_poll_path(@user.id, poll.id), :notice => "Poll created for default course"
			end
		else
			flash[:error] = poll.errors.full_messages.to_sentence
			redirect_to user_path @current_user.id
		end
	end

	def edit
		# has find_user and find_poll so has @user and @poll
		# already checked that user is logged in, now check if correct user
		# if @correct_user
		binding.pry
			render edit_user_poll_path(@poll.user_id, @poll.id)
		# else
		# 	redirect_to user_poll_path(@poll_owner.id), :notice => "You are not allowed to edit this poll"
		# end
		
	end

	def update
		## would prefer better error handling
		if @poll.update_attributes(poll_params)
			redirect_to user_poll_path @user.id, @poll.id, :notice => "Poll updated"
		else
			redirect_to edit_user_poll_path @user.id, @poll.id, :notice => "Error updating"
		end
	end

	def destroy
		@poll.destroy
		redirect_to user_path @current_user.id, :notice => "Poll deleted"
	end

private
	## 
	def find_poll_owner
		@poll = find_poll
		user_id = @poll.user_id
		@poll_owner = (User.find_by_id(user_id)) # || User.find_by_id(@poll.user_id))
		# redirect_to users_path unless @user
	end

	def find_poll
		id = params[:id]
		@poll = Poll.find_by_id(id)
	end

	def is_logged_in?
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def correct_user? # is the current user the owner of this poll? gives @correct_user true/false
		## setting to match master branch
		#if @current_user
			@poll_owner = find_poll_owner
			# @current_user ||= User.find_by(id: session[:user_id])
			## returns result of this comparison
			@correct_user = (@poll_owner == @current_user)
		#end
		#@correct_user = false
	end

	def poll_params
		params.require(:poll). permit(:id, :topic, :user_id, :course_id, :is_open, :time_sent)
	end

end
