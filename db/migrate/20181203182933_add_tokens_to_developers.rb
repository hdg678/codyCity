class AddTokensToDevelopers < ActiveRecord::Migration[5.2]
  def change
    add_column :developers, :provider, :string
    add_column :developers, :uid, :string
    add_column :developers, :tokens, :text

    Student.reset_column_information

    Student.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end

    add_index :developers, [:uid, :provider], unique: true
  end

  def down
    remove_columns :developers, :provider, :uid, :tokens
  end
end
