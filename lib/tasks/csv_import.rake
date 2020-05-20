namespace :csv_import do
  require 'csv'

  desc "TODO"
  task import_students_data_1: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'students_responses_1.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      s = Student.new
      s.full_name = row['Full Name']
      # form 1 doesn't have school email. Alternate emails are assume more personal email than school emails
      s.alternate_email = row['Email']
      s.sex = row['Sex'] == 'Male' ? 0 : 1
      s.existing_educational_level_data = row['Which level are you taking?']
      case row['Which level are you taking?']
      when "PSLE (Primary School)"
        s.subject_1 = row['Most important subject (Pri)']
      when "GCSE O-Level"
        s.subject_1 = row['Most Important (O-level)']
      when "GCSE N(T)-Level"
        s.subject_1 = row['Most important subject N(T)']
      when "GCSE N(A)-Level"
        s.subject_1 = row['Most Important N(A)']
      end
      s.parental_consent = row['I have told my parents that I have filled in the registration form to be a student under the Covid-19 Tutoring Support for Students (CTSS) initiative. It is compulsory to tell your parents and keep them informed about the initiative. '].present? ? true : false
      s.personal_consent = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      # Other subject students need help with (cross-checked with google spreadsheet )
      s.others_subject = row['Subjects you really require help in other than those indicated above. (We will try our best to take into consideration these subjects) - O Level'] if row['Subjects you really require help in other than those indicated above. (We will try our best to take into consideration these subjects) - O Level'].present?
      # Specific A level subject to be stored in JSON subject
      s.subject_preferences = {
        malay_h1: row[' [Malay Language (H1 only)]'],
        tamil_h1: row[' [Tamil Language (H1 only)]'],
        general_paper_h1:  row[' [General Paper (H1 only)]'],
        china_studies_in_eng: row[' [China Studies in English ]'],
        geo: row[' [Geography]'],
        history: row[' [History]'],
        economics: row[' [Economics]'],
        literature_in_eng: row[' [Literature in English]'],
        chinese_lang_and_lit: row[' [Chinese Language and Literature (H2 only)]'],
        mathematics: row[' [Mathematics]'],
        physics: row[' [Physics]'],
        chemistry: row[' [Chemistry]'],
        biology: row[' [Biology]'],
        principle_of_accounts: row[' [Principles of Accounting (H2 only)]']
      }
      s.sent_intro_email = row['Sent introductory email?'] == "Y" ? true : false
      s.created_at = row['Timestamp']
      s.contact_number = row['Contact Number']
      s.imported_data = "Existing student form 1"
      s.save
      puts "#{s.full_name} saved"
    end
    puts "There are now #{Student.where(imported_data: "Existing student form 1").count} rows in the transactions table"
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
      s.sent_intro_email = row['Sent intro email? '] == "Y" ? true : false
      s.created_at = row['Timestamp']
      # This is for top 3 subjects. Assumption is that then the most important subject for that level is present, the 2nd most and 3rd most will be too
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
      s.contact_number = row['Contact Number']
      s.imported_data = "Existing student form 2"
      s.save
      puts "#{s.full_name} saved"
    end
    puts "There are now #{Student.where(imported_data: "Existing student form 2").count} rows in the transactions table"
  end

  task import_tutors_data_1: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'volunteers_responses_1.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    csv.each do |row|
      t = Tutor.new
      t.full_name = row['Full Name']
      t.alternate_email = row['Email']
      t.hours_to_teach = row['How many hours can you commit per week?']
      t.sex = row['Sex'] == 'Male' ? 0 : 1
      t.personal_consent = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      t.created_at = row['Timestamp']
      t.subjects = {
        primary_subjects: row['Subjects (pri)'],
        nt_subjects: row['Subjects (NT'],
        na_subjects: row['Subjects (NA)'],
        o_subjects: row['Subjects (O LEVEL)'],
        h1_chinese_lang: row['Languages [Chinese Language (H1 only)]'],
        general_studies_in_chinese: row['Languages [General Studies in Chinese (H1 only)]'],
        h1_malay: row['Languages [Malay Language (H1 only)]'],
        h1_tamil: row['Languages [Tamil Language (H1 only)]'],
        h1_hindi: row['Languages [Hindi (H1 only)]'],
        french: row['Languages [French ]'],
        german: row['Languages [German]'],
        general_paper: row['Humanities [General Paper (H1 only)]'],
        knowledge_and_inquiry: row['Humanities [Knowledge and Inquiry (H2 only)]'],
        china_studies_in_chinese: row['Humanities [China Studies in Chinese (H2 only)'],
        geo: row['Humanities [Geography]'],
        history: row['Humanities [History]'],
        economics: row['Humanities [Economics]'],
        art: row['Humanities [Art]'],
        music: row['Humanities [Music]'],
        linguistics: row['Humanities [English Language and Linguistics (H2 only)]'],
        chinese_lit: row['Humanities [Chinese Language and Literature (H2 only)]'],
        malay_and_lit: row['Humanities [Malay Language and Literature (H2 only)]'],
        tamil_and_lit: row['Humanities [Tamil Language and Literature (H2 only)]'],
        translation_chinese: row['Humanities [Translation (Chinese) (H2 only)]'],
        mathematics: row['Sciences, Mathematics, Business and Computing [Mathematics]'],
        further_mathematics: row['Sciences, Mathematics, Business and Computing [Further Mathematics (H2 only)]'],
        physics: row['Sciences, Mathematics, Business and Computing [Physics]'],
        chemistry: row['Sciences, Mathematics, Business and Computing [Chemistry]'],
        biology: row['Sciences, Mathematics, Business and Computing [Biology]'],
        management_of_business: row['Sciences, Mathematics, Business and Computing [Management of Business (H2 only)]'],
        principle_of_accounts: row['Sciences, Mathematics, Business and Computing [Principles of Accounting (H2 only)]']
      }
      t.sent_intro_email = row['Sent intro email?'] == "Y" ? true : false
      t.contact_number = row['Contact Number']
      t.imported_data = "Existing tutor form 1"
      t.code_of_conduct = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      t.save
      puts "#{t.full_name} saved"
    end
    puts "There are now #{Tutor.where(imported_data: "Existing tutor form 1").count} rows in the transactions table"
  end

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
      t.subjects = {
        primary_subjects: row['Subjects (Primary)'],
        nt_subjects: row['Subjects N(T) Level'],
        na_subjects: row['Subjects N(A) '],
        o_subjects: row['Subjects - O Level '],
        chinese_h1: row['Languages [Chinese Language (H1 only)]'],
        general_studies_in_chinese: row['Languages [General Studies in Chinese (H1 only)]'],
        malay_h1: row['Languages [Malay Language (H1 only)]'],
        tamil_h1: row['Languages [Tamil Language (H1 only)]'],
        bengali_h1: row['Languages [Bengali (H1 only)]'],
        gujarati_h1: row['Languages [Gujarati (H1 only)]'],
        hindi_h1: row['Languages [Hindi (H1 only)]'],
        french: row['Languages [French ]'],
        german: row['Languages [German]'],
        japanese: row['Languages [Japanese]'],
        spanish: row['Languages [Spanish (H2 only)]'],
        general_paper: row['Humanities [General Paper (H1 only)]'],
        knowledge_and_inquiry: row['Humanities [Knowledge and Inquiry (H2 only)]'],
        china_studies_in_eng: row['Humanities [China Studies in English ]'],
        china_studies_in_chinese: row['Humanities [China Studies in Chinese (H2 only)]'],
        geo: row['Humanities [Geography]'],
        history: row['Humanities [History]'],
        economics: row['Humanities [Economics]'],
        art: row['Humanities [Art]'],
        music: row['Humanities [Music]'],
        literature_in_eng: row['Humanities [Literature in English]'],
        linguistics: row['Humanities [English Language and Linguistics (H2 only)]'],
        chinese_lang_and_lit: row['Humanities [Chinese Language and Literature (H2 only)]'],
        malay_and_lit: row['Humanities [Malay Language and Literature (H2 only)]'],
        tamil_and_lit: row['Humanities [Tamil Language and Literature (H2 only)]'],
        translation_chinese: row['Humanities [Translation (Chinese) (H2 only)]'],
        mathematics: row['Sciences, Mathematics, Business and Computing [Mathematics]'],
        further_mathematics: row['Sciences, Mathematics, Business and Computing [Further Mathematics (H2 only)]'],
        physics: row['Sciences, Mathematics, Business and Computing [Physics]'],
        chemistry: row['Sciences, Mathematics, Business and Computing [Chemistry]'],
        biology: row['Sciences, Mathematics, Business and Computing [Biology]'],
        computing: row['Sciences, Mathematics, Business and Computing [Computing (H2 only)]'],
        management_of_business: row['Sciences, Mathematics, Business and Computing [Management of Business (H2 only)]'],
        principle_of_accounts: row['Sciences, Mathematics, Business and Computing [Principles of Accounting (H2 only)]'],
      }
      t.sent_intro_email = row['Sent intro email?'] == "Y" ? true : false
      t.contact_number = row['Contact Number']
      t.imported_data = "Existing tutor form 2"
      t.code_of_conduct = row['Do you understand and consent to the above code of conduct?'].present? ? true : false
      t.save
      puts "#{t.full_name} saved"
    end
    puts "There are now #{Tutor.where(imported_data: "Existing tutor form 2").count} rows in the transactions table"
  end

  task import_matching_a_level: :environment do
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'matching-a-level.csv'))
    csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
    lines = 0
    csv.each do |row|
      # Extract email from string
      volunteer_name_contains_email = row["Name of Volunteer "]&.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i)&.last
      volunteer_email = row["Volunteer's Email "]&.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i)&.last
      student_email = row["Student's Email "]&.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i)&.last
      tutor_unexpected_id = Tutor.find_by(school_email: volunteer_name_contains_email)&.id
      tutor_id = Tutor.find_by(school_email: volunteer_email)&.id
      student_id = Student.find_by(school_email: student_email)&.id

      # If present, then create a match
      if tutor_id.present? and student_id.present?
        match = Match.new
        match.student_id = student_id
        match.tutor_id = tutor_id
        match.existing_matching_id = row['Match identifier']
        match.save
      end

      # If volunteer name's column contains email, create another match with no identifier
      if volunteer_name_contains_email.present?
        match = Match.new
        match.student_id = student_id
        match.tutor_id = tutor_unexpected_id
        match.save
      end

      puts "Match student: #{student_id} with tutor: #{tutor_id}} on #{student_email}"
      # Count the number of rows!
      lines += 1
    end
    puts "Total lines: #{lines}"
  end
end
