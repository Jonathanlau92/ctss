class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    
  end
  
  private
  def student_params
    params.require(:student).permit(:personal_consent, :full_name, :school_email, :alternate_email, :sex, :education_level, :parental_consent, :match_count, :subject_preferences)
  end
end
