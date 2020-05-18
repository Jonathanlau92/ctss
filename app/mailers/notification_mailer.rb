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
    # check if email address matches email regexp and alternate email present
    if @student.alternate_email.present? && (@student.alternate_email =~ URI::MailTo::EMAIL_REGEXP) == 0
      # If student alternate email does not exist, send to school email
      mail(to: @student.alternate_email, subject: 'Extension of CTSS Programme')
      # Dont send email if both emails are nil
    elsif @student.school_email.present? && (@student.alternate_email =~ URI::MailTo::EMAIL_REGEXP) == 0
      mail(to: @student.school_email, subject: 'Extension of CTSS Programme')
    end
  end

  def extension_email_for_tutor(tutor)
    @tutor = tutor
    if @tutor.alternate_email.present? && (@tutor.alternate_email =~ URI::MailTo::EMAIL_REGEXP) == 0
      mail(to: @tutor.alternate_email, subject: 'Extension of CTSS Programme')
    # Dont send email if both emails are nil
    elsif @tutor.school_email.present? && (@tutor.alternate_email =~ URI::MailTo::EMAIL_REGEXP) == 0
      mail(to: @tutor.school_email, subject: 'Extension of CTSS Programme')
    end
  end
end
