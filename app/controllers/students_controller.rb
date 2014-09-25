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
			student.sms_phone_number = student.sms_phone_number.gsub(/\D/, '')
			student.save
			binding.pry
			redirect_to students_path
		else
			flash[:error] = student.errors.full_messages.to_sentence
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
		if find_student
			@student.destroy
			redirect_to students_path, :notice => "Student deleted"
		else
			redirect_to students_path, :notice => "Unable to delete student"
		end 
	end

	private
		def student_params
			params.require(:student).permit(:first_name, :last_name, :email, :sms_phone_number)
		end

		def find_student
			student_id = params[:id]
			@student = Student.find_by_id(student_id)
		end

end
