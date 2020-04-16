class TutorSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :subjects, :terms_and_conditions

  def show
    @tutor = Tutor.find(session[:tutor_id])
    render_wizard
  end

  def update
    @tutor = Tutor.find(session[:tutor_id])
    @tutor.update_attributes(subject_1: params[:student][:subject_1], subject_2: params[:student][:subject_2], subject_3: params[:student][:subject_3])
    render_wizard @tutor
  end
end
