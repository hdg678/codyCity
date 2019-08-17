class SubmissionsController < ApplicationController
  def index
    if params[:exercise_id]
      @exercise = Exercise.find(params[:exercise_id])
      @submissions = @exercise.submissions

      # Generate null submissions to fill for students who didn't submit
      @students = @exercise.lesson.course.students

      # Remove a student id from the list if they submitted something
      students_unsubmitted = @students.pluck(:id)

      for sub in @submissions
        students_unsubmitted.delete(sub.student.id)
      end

      for unsub in students_unsubmitted
        @submissions << Submission.new(student_id: unsub)
      end
    else
      @submissions = Submission.all
    end
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
  end

  def create
  end
end
