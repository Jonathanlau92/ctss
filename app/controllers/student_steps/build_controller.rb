class StudentSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :subjects, :terms_and_conditions

  def show
    @student = Student.find(session[:student_id])
    render_wizard
  end

  def update
    @student = Student.find(session[:student_id])
    @student.update_attributes(subject_1: params[:student][:subject_1], subject_2: params[:student][:subject_2], subject_3: params[:student][:subject_3])
    render_wizard @student
  end
end
