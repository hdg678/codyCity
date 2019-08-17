class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due_by
      t.integer :classroom_id
      t.integer :points
      t.text :description

      t.timestamps
    end
  end
end
