namespace :csv_import do
  require 'csv'
  desc "TODO"
  task import_students_data_1: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'students_responses_1.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      s = Student.new
      s.full_name = row['Full Name']
      # form 1 doesn't have alternate email
      s.school_email = row['Email']
      s.sex = row['Sex'] == 'Male' ? 0 : 1
      s.existing_educational_level_data = row['Which level are you taking?']
      s.parental_consent = row['I have told my parents that I have filled in the registration form to be a student under the Covid-19 Tutoring Support for Students (CTSS) initiative. It is compulsory to tell your parents and keep them informed about the initiative. '].present? ? true : false
      s.personal_consent = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      s.save
      puts "#{s.full_name} saved"
    end
  end

  task import_students_data_2: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'students_responses_2.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      s = Student.new
      s.full_name = row['Full Name']
      s.school_email = row['School Email']
      s.alternate_email = row['Alternative Email']
      s.sex = row['Sex'] == 'Male' ? 0 : 1
      s.existing_educational_level_data = row['Which level are you taking?']
      s.parental_consent = row['I have told my parents that I have filled in the registration form to be a student under the Covid-19 Tutoring Support for Students (CTSS) initiative. It is compulsory to tell your parents and keep them informed about the initiative. '].present? ? true : false
      s.personal_consent = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      # This is for top 3 subjects
      if row['Most important subject (Pri)'].present?
        s.subject_1 = row['Most important subject (Pri)']
        s.subject_2 = row['2nd Most important subject (Pri)']
        s.subject_3 = row['3rd Most important subject (Pri)']
        s.others_subject = row['Subjects you really require help in other than those indicated above. (We will try our best to take into consideration these subjects) - PSLE']
      elsif row['Most important subject N(T)'].present?
        s.subject_1 = row['Most important subject N(T)']
        s.subject_2 = row['2nd Most important subject N(T)']
        s.subject_3 = row['3rd Most important subject N(T)']
        s.others_subject = row['Subjects you really require help in other than those indicated above. (We will try our best to take into consideration these subjects) - N(T)']
      elsif row['Most Important N(A)'].present?
        s.subject_1 = row['Most Important N(A)']
        s.subject_2 = row['2nd Most important N(A)']
        s.subject_3 = row['3rd Most Important N(A)']
        s.others_subject = row['Subjects you really require help in other than those indicated above. (We will try our best to take into consideration these subjects) - N(A)']
      elsif row['Most Important (O-level)'].present?
        s.subject_1 = row['Most Important (O-level)']
        s.subject_2 = row['2nd Most important (O-level)']
        s.subject_3 = row['3rd Most Important (O-level)']
        s.others_subject = row['Subjects you really require help in other than those indicated above. (We will try our best to take into consideration these subjects) - O Level']
      elsif row['Most Important (A-Level)'].present?
        s.subject_1 = row['Most Important (A-Level)']
        s.subject_2 = row['2nd Most Important (A-Level)']
        s.subject_3 = row['3rd Most Important (A-Level)']
        s.others_subject = row['Subjects you really require help in other than those listed above. (We will try our best to take into consideration these subjects) - A Level']
      end
      s.created_at = row['Timestamp']
      s.save
      puts "#{s.full_name} saved"
    end
    puts "There are now #{Student.count} rows in the transactions table"
  end

  desc "TODO"
  task import_tutors_data_1: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'volunteers_responses_1.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      t = Tutor.new
      t.full_name = row['Full Name']
      t.school_email = row['Email']
      t.hours_to_teach = row['How many hours can you commit per week?']
      t.sex = row['Sex'] == 'Male' ? 0 : 1
      t.personal_consent = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      t.created_at = row['Timestamp']
      t.save
      puts "#{t.full_name} saved"
    end
    puts "There are now #{Tutor.count} rows in the transactions table"
  end

  desc "TODO"
  task import_tutors_data_2: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'volunteers_responses_2.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      t = Tutor.new
      t.full_name = row['Full Name']
      t.school_email = row['School Email']
      t.alternate_email = row['Alternative Email']
      t.hours_to_teach = row['How many hours can you commit per week?']
      t.sex = row['Sex'] == 'Male' ? 0 : 1
      t.personal_consent = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      t.created_at = row['Timestamp']
      # If the following questions are NO, then consent passed. This is for vetting
      if row['Have you ever been charged in a Court of Law in Singapore or in any other country?'] == 'No' and row['Have you ever been involved in care proceedings or in a child protection investigation or enquiry in Singapore or any other country? '] == "No" and row['Are you previously or currently known to the Family Court for Personal Protection Order/ Expedited Order or family violence issues in Singapore or any other country? '] == 'No' and row['Have you been or are you under any financial embarrassment i.e. (a) an undischarged bankrupt, (b) a judgement debtor, (c) have unsecured debts and liabilities of more than 3 months of last-drawn pay, (d) have signed a promissory note or an acknowledgement of indebtedness?'] == 'No'
        t.personal_consent = true
      end
      t.qualification = row['What is the highest educational qualification/certification you have received so far? (E.g. A-Level/Poly Diploma/O-Level/PSLE certificate) ']
      t.past_experiences = row['What past experiences in tutoring do you have? ']
      t.reason_for_volunteering = row['Why do you want to sign up as a volunteer under the CTSS initiative? ']
      t.save
      puts "#{t.full_name} saved"
    end
    puts "There are now #{Tutor.count} rows in the transactions table"
  end
end
