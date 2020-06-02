class Feedback < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  validates :full_name, :matching_number, :date_of_session, :start_time, :end_time, presence: true, if: :step_first_or_others?
  validates :platform, presence: true, if: :identity_tutor?

  validates :topics_covered, :understand_concepts, :other_feedbacks, presence: true, if: :step_others_student?
  validates :topics_covered, :difficulties_with_tutoring, :other_feedbacks, presence: true, if: :step_others_tutor?
  validates :observe_code_of_conduct, :comfortable_with_tutor, acceptance: { accept: [true, false] }, if: :step_others_student? 
  validates :observe_code_of_conduct, acceptance: { accept: [true, false] }, if: :step_others_tutor? 

  def step_first_or_others?
    step.nil? || step == "others"
  end

  def step_others_student?
    step == "others" && identity == "student"
  end

  def step_others_tutor?
    step == "others" && identity == "tutor"
  end

  def identity_tutor?
    identity == "tutor"
  end

  def know_about_program
    ['Instagram', 'Newspapers', 'Facebook', 'Word of Mouth', 'CNA (Channel News Asia)']
  end

  private
  def must_have_one_item
    know_about_program.each do |platform| 
  	  errors.add(:base, 'You must select at least one item') if platform.blank?
  	end
  end
end

