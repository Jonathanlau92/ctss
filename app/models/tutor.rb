class Tutor < ApplicationRecord
  has_many :feedbacks
  has_many :students
  
  has_many :matches
  has_many :students, through: :matches

  enum sex: {male: 0, female: 1}
  
  def primary_level
    ['English', 'Chinese', 'Malay', 'Tamil', 'Math', 'Science', 'Hindi', 'Higher Chinese', 'Higher Malay', 'Higher Tamil', 'Foundation Malay','Foundation Chinese','Foundation Hindi','Foundation Tamil','Foundation English','Foundation Math','Foundation Science']
  end

  def secondary_level
    ["English language syllabus T", "Art", "Music Syllabus T", "Design and Technology Syllabus T", "Math Syllabus T", "Science Syllabus T", "Food Studies", "Basic Chinese", "Basic Malay", "Basic Tamil", "Computer Applications", "Element of business skills", "English language syllabus A", "Literature in English", "Principle of Account", "Design and Technology", "Combined Humanities SS", "Combined Humanities (Geography)", "Combined Humanities (History)", "Combined Humanities (Literature in English)", "History", "Geography", "Hindi", "Math Syllabus A", "Additional Math", "Combined Science (Physics)", "Combined Science (Biology)", "Combined Science (Chemistry)", "Food and Nutrition", "Chinese", "Malay", "Tamil", "English language", "Higher Art", "Combined Humanities (SS)", "Combined Humanities (Literature in Chinese)", "Combined Humanities (Literature in Malay)", "Combined Humanities (Literature in Tamil)", "Spanish", "Japanese", "French", "German", "Economics", "Math", "Higher Chinese", "Music", "Higher Music", "Physics", "Biology", "Chemistry", "Business Studies", "Computing", "Bahasa Indonesia as 3rd language"]
  end

  def jc_level
    ['General Paper (h1)', 'Knowledge and Inquiry (h2)', 'Chinese language(h1 only)', 'China studies in english (h1)', 'China studies in english (h2)', 'China studies in chinese (h2 only)', 'Geography (h1)', 'Geography (h2)','History (h1)', 'History (h2)','Economics (h1)', 'Economics (h2)','Art (h1)', 'Art (h2)', 'Music (h1)', 'Music (h2)','French (h1)', 'French (h2)','German (h1)', 'German (h2)','Japanese (h1)', 'Japanese (h2)','Math (h1)', 'Math (h2)','Physics (h1)', 'Physics (h2)','Chemistry (h1)', 'Chemistry (h2)', 'Biology (h1)', 'Biology (h2)', 'Literature in English (h1)', 'English lang and linguistics (h2 only)', 'Chinese language and lit (h2 only)', 'Malay language and lit (h2 only)', 'Tamil language and lit (h2 only)', 'Translation(Chinese) (h2 only)', 'Malay Language (h1 only)', 'Hindi (h1 only)', 'Spanish (h1 only)', 'Further Mathematics (h2)', 'Computing (h2 only)', 'Management of Business (h2 only)', 'Principle of accounts (h2 only)' ]
  end
end
