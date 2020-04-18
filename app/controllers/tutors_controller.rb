class TutorsController < ApplicationController
  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      session[:tutor_id] = @tutor.id
      redirect_to tutor_step_build_index_path(@tutor.id)
    else
      render :new
    end
  end

  private
  def tutor_params
    params.require(:tutor).permit(:personal_consent, :full_name, :school_email, :alternate_email, :sex, :hours_to_teach, :match_count, :subjects, :hours_to_teach, :qualification, :past_experiences, :reason_for_volunteering, :level_to_teach)
  end
end
