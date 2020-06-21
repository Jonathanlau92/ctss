class StudentSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :subjects, :terms_and_conditions

  def show
    case step
    when :subjects
      @student = Student.new
    else
      @student = Student.new
    end
    render_wizard
  end

  def update
    case step
    when :subjects
      session[:student][:subject] = params[:student]
      redirect_to next_wizard_path
    else
      session[:student][:terms_and_conditions] = params[:student]
      @student = Student.new(full_name: session[:student]["student"]["full_name"], email: session[:student]["student"]["email"], alternate_email: session[:student]["student"]["alternate_email"], give_out_contact: session[:student]["student"]["give_out_contact"], contact_number: session[:student]["student"]["contact_number"], sex: Student.sexes[session[:student]["student"]["sex"]], education_level: Student.education_levels[session[:student]["student"]["education_level"]], specific_level: Student.specific_levels[session[:student]["student"]["specific_level"]], subject_1: session[:student]["subject"]["subject_1"], subject_2: session[:student]["subject"]["subject_2"], subject_3: session[:student]["subject"]["subject_3"], others_subject: session[:student]["subject"]["other_subject"], topics_to_go_through: session[:student]["subject"]["topics_to_go_through"], special_request: session[:student]["subject"]["special_request"], personal_consent:session[:student][:terms_and_conditions]["personal_consent"] )
      if @student.save
        # Clear session after student is saved successfully
        session.clear
        # Send student introductory email on the terms and conditions page
        NotificationMailer.student_introductory_email(@student).deliver_later
        @student.sent_intro_email = true
        render_wizard @student
      else
        redirect_to root_path
      end
    end
  end

  def new
    @student = Student.new
  end

  def create
    # Initialize the structure of the session data
    session[:student] = { student: params[:student], subject: nil, terms_and_conditions: nil }
    # Placeholder for student step id
    redirect_to wizard_path(steps.first, student_step_id: 'students')
  end

  private

  def finish_wizard_path
    student_ending_path
  end

  def student_params
    params.require(:student).permit(:personal_consent, :full_name, :email, :alternate_email, :sex, :education_level, :parental_consent, :match_count, :subject_preferences, :contact_number, :topics_to_go_through, :special_request, :give_out_contact, :specific_level)
  end
end
