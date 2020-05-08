class FeedbackStepsController::BuildController < ApplicationController
  include Wicked::Wizard
  steps :others

  def show
	@feedback = Feedback.find(session[:feedback_id])
	render_wizard
  end

  def update
	render_wizard 
  end
 end
