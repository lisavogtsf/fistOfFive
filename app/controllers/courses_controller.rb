class CoursesController < ApplicationController

	# this controller has mostly public views
	before_action :is_authenticated?, except: [:index, :show]
	before_action :is_logged_in? 
	before_action :find_course, except: [:index]	
	# routes have @course available

	def index
		# does not require login
		@courses = Course.all
		@current_user
		render "index"
	end

	def show
		current_user_affiliated? # @user_affiliated passed in
		binding.pry
		# does not require login, @course available
			@current_user
		@polls = @course.polls
	end

	def new
		# if logged in/authenticated
		@course = Course.new
					@current_user
	end

		# def edit
		# 	# if this user created it
		# 	#@course =?
		# end

		def create
			# checked for logged in/is authenticated above
			course = Course.new(course_params)
			if course.save
				redirect_to course_path(course.id), :notice => "Course created"
			else
				flash[:error] = course.errors.full_messages.to_sentence
				redirect_to new_course_path
			end
		end

		# def update
		# end

		# def destroy
		# 	# if this user created it
		# end

private
	## in this case it finds the course's user_id which does not exist
	# def find_course_owner
	# 	user_id = params[:user_id]
	# 	@user = User.find_by_id(user_id)
	# end

	def find_course
		id = params[:id]
		@course = Course.find_by_id(id)
	end

	def is_logged_in?
			@current_user ||= User.find_by(id: session[:user_id])
	end

	def correct_user?
		@user = find_user
		@current_user ||= User.find_by(id: session[:user_id])
		## returns result of this comparison
		@user == @current_user
	end

	def current_user_affiliated?
		@course = find_course
		if (@course.users.find_by_id(@current_user.id))
			binding.pry
			@user_affiliated = true
		else
			@user_affiliated = false
		end
	end

	def course_params
		params.require(:course). permit(:id, :title, :desc, :schedule, :course_time_zone)
	end

end
