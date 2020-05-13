class FeedbackSteps::BuildController < ApplicationController
	include Wicked::Wizard

	steps :others
	#validate :something_was_checked

	def show
		@feedback_type = params[:type]
		@feedback = Feedback.find(session[:feedback_id])
		render_wizard
	end

	def update
		@feedback = Feedback.find(session[:feedback_id])
    @feedback.know_about_program = {key: params[:know_about_program_ids]}
    #flash[:alert] = {key: params[:know_about_program_ids]}
		@feedback.update_attributes(understand_concepts: params[:feedback][:understand_concepts], topics_covered: params[:feedback][:topics_covered], observe_code_of_conduct: params[:feedback][:observe_code_of_conduct], eleborate: params[:feedback][:eleborate], comfortable_with_tutor: params[:feedback][:comfortable_with_tutor], difficulties_with_tutoring: params[:feedback][:difficulties_with_tutoring], other_feedbacks: params[:feedback][:other_feedbacks])
		render_wizard @feedback
	end

	private
	def something_was_checkeds
		if self.checkbox_attribute.blank?
			self.errors.add(:checkbox_attribute, "You must select at least one option.")
		end
	end
end