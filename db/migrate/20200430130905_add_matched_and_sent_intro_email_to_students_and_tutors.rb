class AddMatchedAndSentIntroEmailToStudentsAndTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :matched, :boolean
    add_column :students, :sent_intro_email, :boolean
    add_column :tutors, :matched, :boolean
    add_column :tutors, :sent_intro_email, :boolean
  end
end
