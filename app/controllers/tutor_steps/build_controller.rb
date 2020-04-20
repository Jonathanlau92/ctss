class TutorSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :vetting, :primary_subjects, :seconday_subjects, :jc_subjects, :terms_and_conditions

  def show
    @tutor = Tutor.find(session[:tutor_id])
    render_wizard
  end

  def update
    @tutor = Tutor.find(session[:tutor_id])
    # Change to case statement when freer
    if params[:primary_subject_ids].present?
      # save subject into json
      @tutor.subjects["primary_subjects"] = params[:primary_subject_ids]
    elsif params[:secondary_subject_ids].present?
      @tutor.subjects["secondary_subjects"] = params[:secondary_subject_ids]
    elsif params[:jc_subject_ids].present?
      @tutor.subjects["jc_subjects"] = params[:jc_subject_ids]
    elsif params[:tutor][:qualification].present?
      @tutor.update_attributes(qualification: params[:tutor][:qualification], past_experiences: params[:tutor][:past_experiences], reason_for_volunteering: params[:tutor][:reason_for_volunteering])
    elsif params[:tutor][:personal_consent].present?
      @tutor.update_attributes(personal_consent: params[:tutor][:personal_consent], code_of_conduct: params[:tutor][:code_of_conduct])
    else
      puts "error"
    end
    @tutor.save
    render_wizard @tutor
  end
end
