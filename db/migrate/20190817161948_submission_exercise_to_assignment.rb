class SubmissionExerciseToAssignment < ActiveRecord::Migration[5.2]
  def change
    rename_column :submissions, :exercise_id, :assignment_id
  end
end
