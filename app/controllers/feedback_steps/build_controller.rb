class FeedbackSteps::BuildController < ApplicationController
	include Wicked::Wizard
	steps :others


	def show
		#@feedback_type = params[:type]
		@feedback = Feedback.find(session[:feedback_id])
		render_wizard
	end

	def update
		@feedback = Feedback.find(session[:feedback_id])
		params[:feedback][:step] = step.to_s
    @feedback.know_about_program = {key: params[:know_about_program_ids]}
    flash[:alert] = @feedback.identity
		@feedback.update_attributes(understand_concepts: params[:feedback][:understand_concepts], topics_covered: params[:feedback][:topics_covered], observe_code_of_conduct: params[:feedback][:observe_code_of_conduct], eleborate: params[:feedback][:eleborate], comfortable_with_tutor: params[:feedback][:comfortable_with_tutor], difficulties_with_tutoring: params[:feedback][:difficulties_with_tutoring], other_feedbacks: params[:feedback][:other_feedbacks], step: params[:feedback][:step])
		render_wizard @feedback
	end

	private
	def feedback_params
		params.require(:feedback).permit(:understand_concepts, :topics_covered, :observe_code_of_conduct, :eleborate, :comfortable_with_tutor, :difficulties_with_tutoring, :other_feedbacks, :step)
	end
end