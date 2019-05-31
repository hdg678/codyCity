class RemoveTestFileUrlFromExercises < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercises, :test_file_url, :string
  end
end
