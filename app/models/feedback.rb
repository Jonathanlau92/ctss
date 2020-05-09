class Feedback < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  def know_about_program
    ['Instagram', 'Newspapers', 'Facebook', 'Word of Mouth', 'Others']
  end
end

