class AddUserId < ActiveRecord::Migration[5.2]
  def change
    change_table :instructors do |t|
      t.remove :email
      t.integer :user_id
    end

    change_table :students do |t|
      t.remove :email
      t.integer :user_id
    end

    change_table :developers do |t|
      t.remove :email
      t.integer :user_id
    end

    change_table :admins do |t|
      t.remove :email
      t.integer :user_id
    end

    add_foreign_key :instructors, :users
    add_foreign_key :students, :users
    add_foreign_key :developers, :users
    add_foreign_key :admins, :users

    add_column :users, :account_id, :integer
    add_column :users, :account_type, :string
  end
end
