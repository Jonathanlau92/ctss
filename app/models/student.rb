class Student < ApplicationRecord
  has_many :feedbacks
  has_many :tutors 
  has_many :matches
  has_many :tutors, through: :matches

  # validates :full_name, :school_email, :sex, :education_level, presence: true, if: :active_or_subjects?

  # validates :subject_1, :subject_2, :subject_3, presence: true, if: :active?

  enum sex: {male: 0, female: 1}
  enum education_level: {PSLE: 0, NT_level: 1, NA_level: 2, O_level: 3, A_level: 4}
  enum specific_level: { p1: 0, p2: 1, p3: 2, p4: 3, p5: 4, p6: 5, sec_1: 6, sec_2: 7, sec_3: 8, sec_4: 9, sec_5: 10, j1: 11, j2: 12}

  # after_update :delete_record_if_incomplete

  # def active?
  #   status == 'active'
  # end

  # def active_or_subjects?
  #   status.include?('subjects') || active?
  # end

  def psle
    ['English', 'Chinese', 'Malay', 'Tamil', 'Math', 'Science', 'Hindi', 'Higher Chinese', 'Higher Malay', 'Higher Tamil', 'Foundation Malay','Foundation Chinese','Foundation Hindi','Foundation Tamil','Foundation English','Foundation Math','Foundation Science']
  end

  def nt_level
    ['English language syllabus T', 'Art', 'Music Syllabus T', 'Design and Technology Syllabus T', 'Math Syllabus T', 'Science Syllabus T', 'Food Studies', 'Basic Chinese', 'Basic Malay', 'Basic Tamil', 'Computer Applications','Element of business skills']
  end

  def na_level
    ['English language syllabus A', 'Literature in English', 'Principle of Account', 'Art', 'Design and Technology', 'Combined Humanities SS', 'Combined Humanities (Geography)','Combined Humanities (History)','Combined Humanities (Literature in English)','History', 'Geography', 'Hindi', 'Math Syllabus A','Additional Math','Combined Science (Physics)','Combined Science (Biology)', 'Combined Science (Chemistry)','Food and Nutrition', 'Chinese', 'Malay', 'Tamil']
  end

  def o_level
    ['English language', 'Literature in English', 'Principle of Account', 'Art', 'Higher Art', 'Design and Technology', 'Combined Humanities (SS)', 'Combined Humanities (Geography)','Combined Humanities (History)','Combined Humanities (Literature in English)', 'Combined Humanities (Literature in Chinese)', 'Combined Humanities (Literature in Malay)', 'Combined Humanities (Literature in Tamil)', 'History', 'Geography', 'Hindi', 'Spanish', 'Japanese', 'French', 'German', 'Economics', 'Math', 'Additional Math', 'Combined Science (Physics)','Combined Science (Biology)', 'Combined Science (Chemistry)','Food and Nutrition', 'Chinese', 'Higher Chinese', 'Malay', 'Tamil', 'Music', 'Higher Music', 'Physics', 'Biology', 'Chemistry', 'Business Studies', 'Computing', 'Bahasa Indonesia as 3rd language']
  end

  def a_level
    ['General Paper (h1)', 'Knowledge and Inquiry (h2)', 'Chinese language(h1 only)', 'China studies in english (h1)', 'China studies in english (h2)', 'China studies in chinese (h2 only)', 'Geography (h1)', 'Geography (h2)','History (h1)', 'History (h2)','Economics (h1)', 'Economics (h2)','Art (h1)', 'Art (h2)', 'Music (h1)', 'Music (h2)','French (h1)', 'French (h2)','German (h1)', 'German (h2)','Japanese (h1)', 'Japanese (h2)','Math (h1)', 'Math (h2)','Physics (h1)', 'Physics (h2)','Chemistry (h1)', 'Chemistry (h2)', 'Biology (h1)', 'Biology (h2)', 'Literature in English (h1)', 'English lang and linguistics (h2 only)', 'Chinese language and lit (h2 only)', 'Malay language and lit (h2 only)', 'Tamil language and lit (h2 only)', 'Translation(Chinese) (h2 only)', 'Malay Language (h1 only)', 'Hindi (h1 only)', 'Spanish (h1 only)', 'Further Mathematics (h2)', 'Computing (h2 only)', 'Management of Business (h2 only)', 'Principle of accounts (h2 only)' ]
  end
end
