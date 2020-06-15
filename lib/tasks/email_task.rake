namespace :email_task do
  desc "Send extension emails to all tutors and students"
  task send_student_extension_emails: :environment do
    Student.all.each do |student|
      NotificationMailer.extension_email_for_student(student).deliver_now
    end
  end

  task send_tutor_extension_emails: :environment do
    Tutor.all.each do |tutor|
      NotificationMailer.extension_email_for_tutor(tutor).deliver_now
    end
  end

  task send_new_tutor_introductory_emails: :environment do
    Tutor.where(sent_intro_email: false).each do |tutor|
      NotificationMailer.tutor_introductory_email(tutor).deliver_now
      tutor.sent_intro_email = true
      tutor.save
    end
  end
end
