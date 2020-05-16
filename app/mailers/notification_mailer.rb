class NotificationMailer < ApplicationMailer
  def student_introductory_email(student)
    @student = student
    mail(to: @student.school_email, subject: 'CTSS Student Introductory Email')
  end

  def tutor_introductory_email(tutor)
    @tutor = tutor
    mail(to: @tutor.school_email, subject: 'CTSS Volunteer Introductory Email')
  end

  def extension_email_for_student(student)
  	@student = student
  	mail(to: @student.school_email, subject: 'Extension of CTSS Programme')
  end

  def extension_email_for_tutor(tutor)
  	@tutor = tutor
  	mail(to: @tutor.school_email, subject: 'Extension of CTSS Programme')
  end
end
