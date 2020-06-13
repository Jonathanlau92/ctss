class StudentSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :subjects, :terms_and_conditions

  def show
    @student = Student.find(session[:student_id])
    render_wizard
  end

  def update
    @student = Student.find(session[:student_id])
    # params[:student][:status] = step.to_s
    # params[:student][:status] = 'active' if step == steps.last
    if params[:student][:subject_1].present?
      @student.update_attributes(subject_1: params[:student][:subject_1], subject_2: params[:student][:subject_2], subject_3: params[:student][:subject_3], others_subject: params[:student][:others_subject], topics_to_go_through: params[:student][:topics_to_go_through], special_request: params[:student][:special_request])
    else
      @student.update_attributes(personal_consent: params[:student][:personal_consent])
      # Send student introductory email on the terms and conditions page
      NotificationMailer.student_introductory_email(@student).deliver_later
    end
    render_wizard @student
  end

  def finish_wizard_path
    student_ending_path
  end
end
