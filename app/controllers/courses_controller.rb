class CoursesController < ApplicationController

	# this controller has mostly public views
	before_action :is_authenticated?, except: [:index, :show]
	before_action :is_logged_in? 
	before_action :find_course, except: [:index]	
	# routes have @course, @current_user available

	def index
		# does not require login
		@courses = Course.all
		@current_user
		render "index"
	end

	def show
		if @current_user # if logged in
			current_user_affiliated? # is the current user in this course?
			@user_affiliated
		# does not require login, @course available
		end
		@polls = @course.polls
	end

	def join_course
		# comes from courses/:id page
		@course = Course.find_by_id(params[:format])
		@current_user
		@current_user.courses << @course

		redirect_to user_path(@current_user.id)
	end

	def leave_course
		# comes from courses/:id page
		@course = Course.find_by_id(params[:format])
		@current_user
		# remove course from user courses
		@current_user.courses.delete(@course.id)

		redirect_to user_path(@current_user.id)
	end

	def new
		# if logged in/authenticated
		@course = Course.new
		@current_user
	end

	def edit
		render edit_course_path(course.id)	
	end

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

	def update
		
	end

		# def destroy
		# 	# if this user created it
		# end

private

	def find_course
		id = params[:id]
		@course = Course.find_by_id(id)
	end

	def is_logged_in?
		@current_user ||= User.find_by(id: session[:user_id])
	end

	## as no user is saved on courses, there is no correct user
	# def correct_user?
	# 	@user = find_user
	# 	@current_user ||= User.find_by(id: session[:user_id])
	# 	## returns result of this comparison
	# 	@user == @current_user
	# end

	def current_user_affiliated?
		# is the current user is logged in and affiliated with this course
		@course = find_course
		if (@course.users.count && @course.users.find_by_id(@current_user.id))
			@user_affiliated = true
		else
			@user_affiliated = false
		end
	end

	def course_params
		params.require(:course). permit(:id, :title, :desc, :schedule, :course_time_zone)
	end

end
