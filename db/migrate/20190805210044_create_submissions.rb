class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.integer :student_id
      t.integer :exercise_id
      t.text :notes
      t.float :points
      t.float :max_points

      t.timestamps
    end
  end
end
