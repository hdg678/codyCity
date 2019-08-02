class CreateJoinTableDeveloperCourse < ActiveRecord::Migration[5.2]
  def change
    create_join_table :developers, :courses do |t|
      t.index :developer_id
      t.index :course_id
    end
  end
end
