class TutorsController < ApplicationController
  
  private
  def tutor_params
    params.require(:tutor).permit(:personal_consent, :full_name, :school_email, :alternate_email, :sex, :hours_to_teach, :match_count, :subjects)
  end
end
