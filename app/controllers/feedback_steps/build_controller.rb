class FeedbackSteps::BuildController < ApplicationController
  include Wicked::Wizard
  steps :others, :end

  def show
    @feedback = Feedback.find(session[:feedback_id])
    render_wizard
  end

  def update
    @feedback = Feedback.find(session[:feedback_id])
    @feedback.know_about_program = {key: params[:know_about_program_ids]}
    # Set the step to validate according to student and tutor in feedback.rb
    @feedback.update_attributes(understand_concepts: params[:feedback][:understand_concepts], topics_covered: params[:feedback][:topics_covered], observe_code_of_conduct: params[:feedback][:observe_code_of_conduct], elaborate: params[:feedback][:elaborate], comfortable_with_tutor: params[:feedback][:comfortable_with_tutor], difficulties_with_tutoring: params[:feedback][:difficulties_with_tutoring], other_feedbacks: params[:feedback][:other_feedbacks], step: step.to_s)
    render_wizard @feedback
  end

  private
  def feedback_params
    params.require(:feedback).permit(:understand_concepts, :topics_covered, :observe_code_of_conduct, :elaborate, :comfortable_with_tutor, :difficulties_with_tutoring, :other_feedbacks, :step)
  end
end
