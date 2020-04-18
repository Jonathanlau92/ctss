class TutorSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :vetting, :subjects, :terms_and_conditions

  def show
    @tutor = Tutor.find(session[:tutor_id])
    render_wizard
  end

  def update
    @tutor = Tutor.find(session[:tutor_id])
    @tutor.update_attributes(qualification: params[:tutor][:qualification], past_experiences: params[:tutor][:past_experiences], reason_for_volunteering: params[:tutor][:reason_for_volunteering])
    render_wizard @tutor
  end
end
