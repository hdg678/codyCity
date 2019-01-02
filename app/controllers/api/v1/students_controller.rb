class Api::V1::StudentsController < Api::V1::APIController
  include DeviseTokenAuth::Concerns::SetUserByToken

  # GET

  # GET /api/v1/students
  def index
    @students = Student.all
    render json: @students
  end

  # GET /api/v1/students/1
  def show
    render json: student
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
