class StudentController < ApplicationController

	def index
		@student = Student.all
	end	

	def show
		@student = Student.find(params[:id])
	end	

	def new
		@student = Student.new
	end
	
	def createStudent
		@student = Student.new(params.required(:student).permit(:first_name, :last_name, :email, :password))
			@student.save
	end
	
	def edit
		@student = Student.find(params[:id])
	end	

	def update
		@student = Student.edit(:email, :update)
	end	


end
