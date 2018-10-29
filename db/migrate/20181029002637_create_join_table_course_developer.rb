class CreateJoinTableCourseDeveloper < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Courses, :Developers do |t|
      # t.index [:course_id, :developer_id]
      # t.index [:developer_id, :course_id]
    end
  end
end
