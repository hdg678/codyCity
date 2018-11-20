class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.references :organization, foreign_key: true
      t.string :title
      t.text :description
      t.string :image_url
      t.references :developer, foreign_key: true

      t.timestamps
    end
  end
end
