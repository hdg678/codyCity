class Api::V1::ExercisesController < Api::V1::APIController
  def show
    render json: {
      exercise_path: 'https://www.google.com',
      exercise_name: 'exercise',
      test_path: 'https://www.google.com',
      test_name: 'exercise_test'
    }
  end

  def push
    success = false
    if success
      render json: { message: 'successful submission' }
    else
      render json: { message: 'failed submission' }
    end
  end
end
