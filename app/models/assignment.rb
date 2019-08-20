class Assignment < ApplicationRecord
  belongs_to :classroom
  has_many :submissions

  def past_due?
    self.due_by < Date.today
  end

  def grades
    submissions = []

    self.classroom.students.each do |student|
      submission = self.submissions.where(student_id: student.id)[0]
      if !submission
        submission = Submission.new(student: student, points: 0)
      end

      submissions.append(submission)
    end

    submissions
  end
end
