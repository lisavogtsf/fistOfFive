class CoursesController < ApplicationController

	# this controller has mostly public views

  def index
  	@courses = Course.all
  end

  def show
  end

  def new
  	# if logged in
  end

  def edit
  	# if this user created it
  end

  def create

  end

  def update
  end

  def destroy
  	# if this user created it
  end

private
	## 
	def find_user
		user_id = params[:user_id]
		@user = User.find_by_id(user_id)
	end

	def find_user_course
		id = params[:id]
		@course = Course.find_by_id(id)
	end

	def correct_user?
		@user = find_user
		@current_user ||= User.find_by(id: session[:user_id])
		## returns result of this comparison
		@user == @current_user
	end

	def course_params
		params.require(:course). permit(:id, :title, :desc, :schedule, :course_time_zone)
	end

end
