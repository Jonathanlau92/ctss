class Feedback < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :student
  belongs_to :tutor

  validate :must_have_one_item

  def know_about_program
    ['Instagram', 'Newspapers', 'Facebook', 'Word of Mouth', 'Others']
  end

  private
  def must_have_one_item
    know_about_program.each do |platform| 
  	  errors.add(:base, 'You must select at least one item') if platform.blank?
  	end
  end
end

