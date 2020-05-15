namespace :email_task do
  desc "Send extension emails to all tutors and students"
  task send_student_extension_emails: :environment do
    Student.all.each do |student|
      NotificationMailer.extension_email_for_student(student).deliver
    end
  end

  task send_tutor_extension_emails: :environment do
    Tutor.all.each do |tutor|
      NotificationMailer.extension_email_for_student(tutor).deliver
    end
  end
end
