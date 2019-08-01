class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @exercises = Exercise.all
  end

  def show
  end

  def download_exercise_file
    @exercise = Exercise.find(params[:exercise_id])
    send_data @exercise.exercise_file.download,
      filename: @exercise.exercise_file.filename.to_s,
      content_type: @exercise.exercise_file.content_type
  end

  def download_test_file
    @exercise = Exercise.find(params[:exercise_id])
    send_data @exercise.test_file.download,
      filename: @exercise.test_file.filename.to_s,
      content_type: @exercise.test_file.content_type
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      redirect_to @exercise
    else
      render :edit
    end
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @exercise = @lesson.exercises.new(exercise_params)
    if @exercise.save
      redirect_to @exercise
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:title, :instructions, :point_value, :exercise_file, :test_file)
  end
end
