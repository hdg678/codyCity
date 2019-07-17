o1 = Organization.create name: 'organization-1'
o1.save

1.upto(5) do |i|
  u = User.new email: "student-#{i}@example.com", password_digest: BCrypt::Password.create("student-#{i}@example.com")
  s = Student.new user: u, organization: o1
  s.save!
  u.save!
end

1.upto(3) do |i|
  u = User.new email: "instructor-#{i}@example.com", password_digest: BCrypt::Password.create("instructor-#{i}@example.com")
  i = Instructor.new user: u, organization: o1
  i.save!
  u.save!
end

1.upto(3) do |i|
  u = User.new email: "developer-#{i}@example.com", password_digest: BCrypt::Password.create("developer-#{i}@example.com")
  d = Developer.new user: u, organization: o1
  d.save!
  u.save!
end

1.upto(2) do |i|
  u = User.new email: "admin-#{i}@example.com", password_digest: BCrypt::Password.create("admin-#{i}@example.com")
  a = Admin.new user: u, organization: o1
  a.save!
  u.save!
end

c1 = o1.courses.create! title: "My test course 1", description: "This is simply the most awesome course ever", developer: o1.developers.first
1.upto(5) do |i|
  l = c1.lessons.create! title: "Lesson #{i}"
  1.upto(5) do |j|
    l.exercises.create! title: "Exercise #{j}", point_value: 1
  end
end
1.upto(5) do |i|
  Student.find(i).courses << c1
end
