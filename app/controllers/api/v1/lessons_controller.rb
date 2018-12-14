class Api::V1::LessonsController < Api::V1::APIController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_instructor!, only: [:create, :update, :destroy]

  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  def show
    render json: @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
  end

  def update
    @lesson.update(lesson_params)
  end

  def destroy
    @lesson.destroy
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :course_id)
  end
end
