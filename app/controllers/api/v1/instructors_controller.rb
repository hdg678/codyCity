class Api::V1::InstructorsController < Api::V1::APIController
  # GET

  # GET /api/v1/instructors
  def index
    @instructors = Instructor.all
    render json: @instructors
  end

  # GET /api/v1/instructors/1
  def show
    render json: instructor
  end

  # POST /api/v1/instructors
  def create
    new_instructor(instructor_params).save
    render json: @instructor
  end
    

  private

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :email, :password, :course_id)
  end

  def instructor
    @instructor ||= Instructor.find(params[:id])
  end

  def new_instructor(attrs={})
    @instructor ||= Instructor.new(attrs)
  end
end
