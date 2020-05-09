class FeedbackSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :others

  def show
  	@feedback_type = params[:type]
	@feedback = Feedback.find(session[:feedback_id])
	render_wizard
  end

  def update
  	@feedback = Feedback.find(session[:feedback_id])
  	@feedback.update_attributes(understand_concepts: params[:feedback][:understand_concepts], observe_code_of_conduct: params[:feedback][:observe_code_of_conduct], eleborate: params[:feedback][:eleborate], comfortable_with_tutor: params[:feedback][:comfortable_with_tutor], platform: params[:feedback][:platform], difficulties_with_tutoring: params[:feedback][:difficulties_with_tutoring], know_about_program: params[:feedback][:know_about_program], other_feedbacks: params[:feedback][:other_feedbacks])
	render_wizard @feedback
  end
 end
