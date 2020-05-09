class FeedbacksController < ApplicationController

	def new
		@feedback_type = params[:type]
		@feedback = Feedback.new
		@students = Student.all
		@tutors = Tutor.all
	end

	def create
		@feedback = Feedback.new(feedback_params)
		if @feedback.save
			session[:feedback_id] = @feedback.id
			redirect_to feedback_step_build_index_path(@feedback.id, :type => params[:feedback][:type])
		else
			render :new
		end
	end

	def update
		@feedback = Feedback.find(params[:id])
		#if @student.update_attributes(personal_consent: params[:student][:personal_consent])
		#  redirect_to root_paths
		#else
		#  render :new
		#end
	end

	private
	def feedback_params
		params.require(:feedback).permit(:matching_number, :full_name, :date_of_session, :start_time, :end_time, :topics_covered, 
			:understand_concepts, :observe_code_of_conduct, :eleborate, :comfortable_with_tutor, :other_feedback, :know_about_program, 
			:platform, :difficulties_with_tutoring, :tutor_id, :student_id)
	end
end

