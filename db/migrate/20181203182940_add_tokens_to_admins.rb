class AddTokensToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :provider, :string
    add_column :admins, :uid, :string
    add_column :admins, :tokens, :text

    Student.reset_column_information

    Student.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end

    add_index :admins, [:uid, :provider], unique: true
  end

  def down
    remove_columns :admins, :provider, :uid, :tokens
  end
end
