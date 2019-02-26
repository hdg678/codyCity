class AddPropertiesToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :exercise_file_url, :string
    add_column :exercises, :public_test_file_url, :string
  end
end
