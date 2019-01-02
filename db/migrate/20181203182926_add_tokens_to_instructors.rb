class AddTokensToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :provider, :string
    add_column :instructors, :uid, :string
    add_column :instructors, :tokens, :text

    Student.reset_column_information

    Student.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end

    add_index :instructors, [:uid, :provider], unique: true
  end

  def down
    remove_columns :instructors, :provider, :uid, :tokens
  end
end
