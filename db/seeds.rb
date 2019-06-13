o1 = Organization.create name: 'organization-1'
o1.save

1.upto(5) do |i|
  s = Student.new email: "student-#{i}@example.com", password: "student-#{i}@example.com", provider: "email", organization: o1
  s.skip_confirmation!
  s.save!
end

1.upto(3) do |i|
  i = Instructor.new email: "instructor-#{i}@example.com", password: "instructor-#{i}@example.com", provider: "email", organization: o1
  i.skip_confirmation!
  i.save!
end

1.upto(3) do |i|
  d = Developer.new email: "developer-#{i}@example.com", password: "developer-#{i}@example.com", provider: "email", organization: o1
  d.skip_confirmation!
  d.save!
end

1.upto(2) do |i|
  a = Admin.new email: "admin-#{i}@example.com", password: "admin-#{i}@example.com", provider: "email", organization: o1
  a.skip_confirmation!
  a.save!
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
