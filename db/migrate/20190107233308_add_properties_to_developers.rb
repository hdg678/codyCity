class AddPropertiesToDevelopers < ActiveRecord::Migration[5.2]
  def change
    add_column :developers, :first_name, :string
    add_column :developers, :last_name, :string
    add_column :developers, :is_teacher, :boolean
    add_column :developers, :github_username, :string
    add_column :developers, :github_password, :string
  end
end
