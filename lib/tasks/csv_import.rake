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
      end
      s.created_at = row['F']
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
      t.subjects = {
        primary_subjects: row['Subjects (pri)']
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
        computing: row['Sciences, Mathematics, Business and Computing [Computing (H2 only)]'],
      }
      t.save
      puts "#{t.full_name} saved"
    end
    puts "There are now #{Tutor.count} rows in the transactions table"
  end
end
