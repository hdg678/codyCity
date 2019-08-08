class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.integer :instructor_id
      t.integer :course_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
