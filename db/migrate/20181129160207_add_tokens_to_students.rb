class AddTokensToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :provider, :string
    add_column :students, :uid, :string
    add_column :students, :tokens, :text

    Student.reset_column_information

    Student.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end

    add_index :students, [:uid, :provider], unique: true
  end

  def down
    remove_columns :students, :provider, :uid, :tokens
  end
end
