class StudentsController < ApplicationController

  # GET

  # GET /students
	def index
		if params[:course]
			@course = Course.find(params[:course])
			@students = @course.students
		else
			@students = Student.all
		end
	end

  # GET /students/1
	def show
		student
	end

  # GET /students/new
	def new
    new_student
	end

  # POST /students
	def create
    if new_student(student_params).save
      redirect_to new_student
    else
      render :new
    end
	end

  # GET /students/:id/edit
	def edit

	end

  # PATCH/PUT /students/1
	def update

	end

  # DELETE /students/1
  def destroy

  end

private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password)
  end

  def student
    @student ||= Student.find(params[:id])
  end

  def new_student(attrs={})
    @student ||= Student.new(attrs)
  end

end
