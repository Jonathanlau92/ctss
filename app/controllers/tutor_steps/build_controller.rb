class TutorSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :vetting, :primary_subjects, :seconday_subjects, :jc_subjects, :declaration, :terms_and_conditions

  def show
    case step
    when :vetting
      # For the form
      @tutor = Tutor.new
    when :primary_subjects
      # For the form
      @tutor = Tutor.new
    when :seconday_subjects
      # For the form
      @tutor = Tutor.new
    when :jc_subjects
      # For the form
      @tutor = Tutor.new
    when :declaration
      # For the form
      @tutor = Tutor.new
    else
      @tutor = Tutor.new
    end
    render_wizard
  end

  def update
    case step
    when :vetting
      session[:tutor][:vetting] = params[:tutor]
      redirect_to next_wizard_path
    when :primary_subjects
      session[:tutor][:primary_subjects] = params[:primary_subject_ids] if params[:primary_subject_ids].present?
      redirect_to next_wizard_path
    when :seconday_subjects
      session[:tutor][:secondary_subjects] = params[:secondary_subject_ids] if params[:secondary_subject_ids].present?
      redirect_to next_wizard_path
    when :jc_subjects
      session[:tutor][:jc_subjects] = params[:jc_subject_ids] if params[:jc_subject_ids].present?
      redirect_to next_wizard_path
    when :declaration
      session[:tutor][:declaration] = params[:tutor]
      redirect_to next_wizard_path
    else
      session[:tutor][:terms_and_conditions] = params[:tutor]
      @tutor = Tutor.new(full_name: session[:tutor]["tutor"]["full_name"], email: session[:tutor]["tutor"]["email"], alternate_email: session[:tutor]["tutor"]["alternate_email"], give_out_contact: session[:tutor]["tutor"]["give_out_contact"], contact_number: session[:tutor]["tutor"]["contact_number"], sex: Student.sexes[session[:tutor]["tutor"]["sex"]], hours_to_teach: session[:tutor]["tutor"]["hours_to_teach"], commit_to_extension: session[:tutor]["tutor"]["commit_to_extension"],
        past_experiences: session[:tutor]["vetting"]["past_experiences"], qualification: session[:tutor]["vetting"]["qualification"], reason_for_volunteering: session[:tutor]["vetting"]["reason_for_volunteering"],
        declare_1: session[:tutor]["declaration"]["declare_1"], declare_2: session[:tutor]["declaration"]["declare_2"], declare_3: session[:tutor]["declaration"]["declare_3"], declare_4: session[:tutor]["declaration"]["declare_4"],
        personal_consent: session[:tutor][:terms_and_conditions]["personal_consent"],
        code_of_conduct: session[:tutor][:terms_and_conditions]["code_of_conduct"]
      )
      @tutor.subjects["primary_subjects"] = session[:tutor]["primary_subjects"].join(', ') if session[:tutor]["primary_subjects"].present?
      @tutor.subjects["secondary_subjects"] = session[:tutor]["secondary_subjects"].join(', ') if session[:tutor]["secondary_subjects"].present?
      @tutor.subjects["jc_subjects"] = session[:tutor]["jc_subjects"].join(', ') if session[:tutor]["jc_subjects"].present?

      if @tutor.save
        # Clear session after student is saved successfully
        session.clear
        # Send student introductory email on the terms and conditions page
        NotificationMailer.tutor_introductory_email(@tutor).deliver_later
        @tutor.sent_intro_email = true
        render_wizard @tutor
      else
        redirect_to root_path
      end
    end
  end

  def new
    @tutor = Tutor.new
  end

  def create
    # Initialize the structure of the session data
    session[:tutor] = { tutor: params[:tutor], vetting: nil, primary_subjects: nil, secondary_subjects: nil, jc_subjects: nil, declaration: nil, terms_and_conditions: nil }
    # Placeholder for student step id
    redirect_to wizard_path(steps.first, tutor_step_id: 'tutors')
  end

  private

  def finish_wizard_path
    tutor_ending_path
  end

  def tutor_params
    params.require(:tutor).permit(:personal_consent, :full_name, :email, :alternate_email, :sex, :match_count, :subjects, :hours_to_teach, :qualification, :past_experiences, :reason_for_volunteering, :level_to_teach, :code_of_conduct, :contact_number, :declare_1, :declare_2, :declare_3, :declare_4, :give_out_contact, :commit_to_extension)
  end
end
