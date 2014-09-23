class StudentsController < ApplicationController

	## authentication?
	before_action :is_authenticated?

	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def create
		student = Student.new(student_params)
		if student.save
			redirect_to students_path
		else
			flash[:error] = student.errors.full_massages.to_sentence
			redirect_to users_path 
		end 
	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def student_params
			params.require(:student).permit(:first_name, :last_name, :email, :sms_phone_number)
		end

end
