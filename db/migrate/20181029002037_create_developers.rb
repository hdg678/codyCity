class CreateDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :github_username
      t.string :github_password
      t.boolean :is_teacher

      t.timestamps
    end
  end
end
