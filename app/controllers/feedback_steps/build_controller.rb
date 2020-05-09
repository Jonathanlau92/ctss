class FeedbackSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :others

  def show
	@feedback = Feedback.find(session[:feedback_id])
	render_wizard
  end

  def update
  	@feedback = Feedback.find(session[:feedback_id])
	render_wizard 
  end
 end