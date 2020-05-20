namespace :scheduler do
  desc "this task is to schedule matching to match student and tutor into a classroom"
  task send_test_email: :environment do
    Student.all.each do |s|
      NotificationMailer.student_introductory_email(s).deliver_now
    end
    Tutor.all.each do |t|
      NotificationMailer.tutor_introductory_email(t).deliver_now
    end
  end
end
