class StudentsController < ApplicationController
  def student_welcome

  end
  
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      session[:student_id] = @student.id
      redirect_to student_step_build_index_path(@student.id)
    else
      render :new
    end
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to student_ending_path
    else
      render :new
    end
  end

  private
  def student_params
    params.require(:student).permit(:personal_consent, :full_name, :school_email, :alternate_email, :sex, :education_level, :parental_consent, :match_count, :subject_preferences, :contact_number, :topics_to_go_through, :special_request)
  end
end
