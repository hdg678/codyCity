class AssignmentsController < ApplicationController

  def index
    @classroom = Classroom.find(params[:classroom_id])
    @assignments = @classroom.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @classroom = Classroom.find(params[:classroom_id])
    @assignment = Assignment.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @assignment = @classroom.assignments.new(assignment_params)

    if @assignment.save
      redirect_to @assignment
    else
      render :new
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:name, :description, :due_by, :points)
  end

end
