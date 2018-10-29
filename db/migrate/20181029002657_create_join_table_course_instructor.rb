class CreateJoinTableCourseInstructor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Courses, :Instructors do |t|
      # t.index [:course_id, :instructor_id]
      # t.index [:instructor_id, :course_id]
    end
  end
end
