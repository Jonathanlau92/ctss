class TutorsController < ApplicationController
  before_action :get_tutor, only: [:edit, :update]
  
  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      session[:tutor_id] = @tutor.id
      # Route to tutor wizard path
      redirect_to tutor_step_build_index_path(@tutor.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tutor.update(tutor_params)
      session[:tutor_id] = @tutor.id
      # Route to tutor wizard path
      redirect_to tutor_step_build_index_path(@tutor.id)
    else
      render :edit
    end
  end

  private
  def get_tutor
    @tutor = Tutor.find_by(id: params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:personal_consent, :full_name, :email, :alternate_email, :sex, :hours_to_teach, :match_count, :subjects, :hours_to_teach, :qualification, :past_experiences, :reason_for_volunteering, :level_to_teach, :code_of_conduct, :contact_number, :declare_1, :declare_2, :declare_3, :declare_4)
  end
end
