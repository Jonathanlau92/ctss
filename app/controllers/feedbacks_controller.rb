class FeedbacksController < ApplicationController
  before_action :load_type, only: :create
  
  def load_type
    @feedback_type = params[:feedback][:identity]
  end
  
  def index  	
  end

  def welcome
    @feedback_type = params[:type]
  end

  def new
    @feedback_type = params[:type]
    @feedback = Feedback.new
  end
  
  def create
    @feedback = Feedback.new(feedback_params)
    # Check if matching number exists
    begin
      @feedback.student_id = Match.find_by(existing_matching_id: @feedback.matching_number).student_id
      @feedback.tutor_id = Match.find_by(existing_matching_id: @feedback.matching_number).tutor_id
    rescue NoMethodError => e
    #  flash[:alert] = "Matching number \""+ params[:feedback][:matching_number] + "\"does not exist! Please enter a valid Matching Number"
    end 
    if @feedback.save
      session[:feedback_id] = @feedback.id
      redirect_to feedback_step_build_index_path(@feedback.id, matches: params[:feedback][:existing_matching_id])
    else
      render :new
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:matching_number, :full_name, :date_of_session, :start_time, :end_time, :topics_covered, 
      :understand_concepts, :observe_code_of_conduct, :eleborate, :comfortable_with_tutor, :other_feedback, :know_about_program, 
      :platform, :difficulties_with_tutoring, :tutor_id, :student_id, :identity, :step)
  end
end

