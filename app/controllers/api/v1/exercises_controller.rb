class Api::V1::ExercisesController < Api::V1::APIController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_instructor!, only: [:create, :update, :destroy]

  def index
    @exercises = Exercise.all
    render json: @exercises
  end

  def show
    # TODO: Return these from the model itself
    render json: {
      exercise_path: 'https://www.google.com',
      exercise_name: 'exercise',
      test_path: 'https://www.google.com',
      test_name: 'exercise_test'
    }
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.save
  end

  def update
    @exercise.update(exercise_params)
  end

  def destroy
    @exercise.destroy
  end

  def push
    success = false
    if success
      render json: { message: 'successful submission' }
    else
      render json: { message: 'failed submission' }
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:lesson_id, :title, :instructions, :point_value, :test_file_url)
  end
end
