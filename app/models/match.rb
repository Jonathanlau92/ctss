class Match < ApplicationRecord
  belongs_to :student
  belongs_to :tutor

  after_create :set_matching_id_and_send_email

  def matching_id
  	if self.student.education_level == "PSLE"
    	"P%.5d" % id
    elsif self.student.education_level == "NT_level"
    	"NT%.5d" % id
    elsif self.student.education_level == "NA_level"
    	"NA%.5d" % id
    elsif self.student.education_level == "O_level"
    	"O%.5d" % id
    elsif self.student.education_level == "A_level"
    	"A%.5d" % id
    end	
  end

  def set_matching_id_and_send_email
  	self.existing_matching_id = self.matching_id
  	if self.save
  		NotificationMailer.matching_details_email(self.student, self).deliver_later
  		NotificationMailer.matching_details_email(self.tutor, self).deliver_later
  	end
  end
end
