class TutorSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :vetting, :primary_subjects, :seconday_subjects, :jc_subjects, :declaration, :terms_and_conditions

  def show
    @tutor = Tutor.find(session[:tutor_id])
    render_wizard
  end

  def update
    @tutor = Tutor.find(session[:tutor_id])
    # Change to case statement when freer
    if params[:primary_subject_ids].present?
      # save subject into json as a string of subjects separated by comma
      @tutor.subjects["primary_subjects"] = params[:primary_subject_ids].join(', ')
    elsif params[:secondary_subject_ids].present?
      @tutor.subjects["secondary_subjects"] = params[:secondary_subject_ids].join(', ')
    elsif params[:jc_subject_ids].present?
      @tutor.subjects["jc_subjects"] = params[:jc_subject_ids].join(', ')
    end
    #Check if params[:tutor] is present
    if params[:tutor].present?
      if params[:tutor][:qualification].present?
        @tutor.update_attributes(qualification: params[:tutor][:qualification], past_experiences: params[:tutor][:past_experiences], reason_for_volunteering: params[:tutor][:reason_for_volunteering])
      elsif params[:tutor][:personal_consent].present?
        @tutor.update_attributes(personal_consent: params[:tutor][:personal_consent], code_of_conduct: params[:tutor][:code_of_conduct])
      elsif params[:tutor][:declare_1].present? and params[:tutor][:declare_2].present? and params[:tutor][:declare_3].present? and params[:tutor][:declare_4].present?
        @tutor.update_attributes(declare_1: params[:tutor][:declare_1], declare_2: params[:tutor][:declare_2], declare_3: params[:tutor][:declare_3], declare_4: params[:tutor][:declare_4])
      end
    end
    @tutor.save
    render_wizard @tutor
  end
end
