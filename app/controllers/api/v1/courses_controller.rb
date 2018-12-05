class Api::V1::CoursesController < Api::V1::APIController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_instructor!, only: [:create, :update, :destroy]

  # GET /api/v1/courses
  def index
    @courses = Course.all
    render json: @courses
  end

  # GET /api/v1/courses/1
  def show
    render json: @course
  end

  # POST /api/v1/courses/
  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course
    else
      render json: { message: 'course creation failed', errors: @course.errors }, status: 422
    end
  end

  # PUT /api/v1/courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: { message: 'course update failed', errors: @course.errors }, status: 422
    end
  end

  # DELETE /api/v1/courses/1
  def destroy
    @course.destroy
    render json: { message: 'course destroyed' }
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :image_url, :organization_id, :developer_id)
  end
end
