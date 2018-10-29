class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.references :course, foreign_key: true
      t.integer :value_for_order

      t.timestamps
    end
  end
end
