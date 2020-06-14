namespace :scheduler do
  desc "this task is to schedule matching to match student and tutor into a classroom"
  task match_new_student: :environment do
    Student.where(matched: false).each do |student|
      case student.education_level
      when "PSLE"
        Tutor.where(matched: false).each do |tutor|
          # Maximum 2 matches
          if student.match_count < 4 and tutor.match_count < 4
            # Define student subjects array
            @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
            # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
            # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
            if !tutor.subjects['primary_subjects'].nil? && (@student_subject_array & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
              @intersection = []
              # Shuffle to ensure all subjects get a chance to be matched
              @student_subject_array.shuffle.each do |subject|
                @intersection << subject if tutor.subjects['primary_subjects'].include? subject
              end
              # Increase student count depending on the number of subjects matched
              student.match_count += @intersection.count
              tutor.match_count += @intersection.count
              student.save
              tutor.save
              # Generate matches through the service
              GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
            end
          end
        end
      when ("NT_level" or "NA_level" or "O_level")
        Tutor.where(matched: false).each do |tutor|
          # Maximum 2 matches
          if student.match_count < 4 and tutor.match_count < 4
            # Define student subjects array
            @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
            # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
            # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
            if !tutor.subjects['secondary_subjects'].nil? && (@student_subject_array & tutor.subjects['secondary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
              @intersection = []
              # Shuffle to ensure all subjects get a chance to be matched
              @student_subject_array.shuffle.each do |subject|
                @intersection << subject if tutor.subjects['secondary_subjects'].include? subject
              end
              # Increase student count depending on the number of subjects matched
              student.match_count += @intersection.count
              tutor.match_count += @intersection.count
              student.save
              tutor.save
              # Generate matches through the service
              GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
            end
          end
        end
      when "A_level"
        Tutor.where(matched: false).each do |tutor|
          # Maximum 2 matches
          if student.match_count < 4 and tutor.match_count < 4
            # Define student subjects array
            @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
            # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
            # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
            if !tutor.subjects['jc_subjects'].nil? && (@student_subject_array & tutor.subjects['jc_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
              @intersection = []
              # Shuffle to ensure all subjects get a chance to be matched
              @student_subject_array.shuffle.each do |subject|
                @intersection << subject if tutor.subjects['jc_subjects'].include? subject
              end
              # Increase student count depending on the number of subjects matched
              student.match_count += @intersection.count
              tutor.match_count += @intersection.count
              student.save
              tutor.save
              # Generate matches through the service
              GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
            end
          end
        end
      end
    end
  end
end
