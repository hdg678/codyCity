class CreateJoinTableCourseStudent < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Courses, :Students do |t|
      # t.index [:course_id, :student_id]
      # t.index [:student_id, :course_id]
    end
  end
end
