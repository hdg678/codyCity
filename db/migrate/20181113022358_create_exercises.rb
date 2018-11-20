class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.references :lesson, foreign_key: true
      t.string :title
      t.text :instructions
      t.string :point_value
      t.string :test_file_url

      t.timestamps
    end
  end
end
