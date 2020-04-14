class StudentSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :subjects, :terms_and_conditions

  def show
    @student = Student.find(session[:student_id])
    render_wizard
  end
end
