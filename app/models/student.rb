class Student < ApplicationRecord

	# create_table :students do |t|
 #      t.string :first_name
 #      t.string :last_name
 #      t.string :email
 #      t.string :password

 	has_and_belongs_to_many :courses
 
end
