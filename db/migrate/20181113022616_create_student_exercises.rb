class CreateStudentExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :student_exercises do |t|
      t.references :exercise, foreign_key: true
      t.references :student, foreign_key: true
      t.integer :point_value
      t.references :instructor, foreign_key: true

      t.timestamps
    end
  end
end
