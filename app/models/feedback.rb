class Feedback < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :student
  belongs_to :tutor

  validates :full_name, :matching_number, :date_of_session, :start_time, :end_time, presence: true, if: :step_first?
  validates :full_name, :matching_number, :date_of_session, :start_time, :end_time, :topics_covered, :observe_code_of_conduct, :other_feedbacks, presence: true, if: :step_others?

  def step_first?
    step.nil?
  end

  def step_others?
    step == "others"
  end

  def know_about_program
    ['Instagram', 'Newspapers', 'Facebook', 'Word of Mouth', 'CNA(Channel NewsAsia)']
  end

  private
  def must_have_one_item
    know_about_program.each do |platform| 
  	  errors.add(:base, 'You must select at least one item') if platform.blank?
  	end
  end
end

