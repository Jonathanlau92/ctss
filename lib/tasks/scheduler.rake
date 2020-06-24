namespace :scheduler do
  desc "this task is to schedule matching to match student and tutor into a classroom"
  task match_new_student_to_tutor: :environment do
    # Each tutor can only have one match
    Tutor.where(matched: false).each do |tutor|
      # Shuffle the student to give more changes to later students
      Student.where(matched: false).shuffle.each do |student|
        case student.education_level
        when "PSLE"
          # Define student subjects array
          @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
          # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
          # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
          if !tutor.subjects['primary_subjects'].nil? && (@student_subject_array & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
            @intersection = []
            # Shuffle to ensure all subjects get a chance to be matched
            @student_subject_array.shuffle.each do |subject|
              # This checks if student is already matched for an particular subject
              if Match.where(student_id: student.id, subject_matched: subject).any?
                next
              else
                # Subject could be nil. Dont want to send it if that's the case
                @intersection << subject if tutor.subjects['primary_subjects'].include? subject and subject.present?
              end
            end
            # Check if match already exists, if it does, continue the loop with the next student
            if Match.where(student_id: student.id, tutor_id: tutor.id, subject_matched: @intersection.first).any? or @intersection.first.nil?
              next
            else
              new_match = GenerateMatchesService.new(student, tutor, @intersection.first).run
              # Stop student loop if new match is found for tutor as 1 tutor is assign to 1 student
              if new_match.success?
                # Increase student count by 1 as we are only matching once
                student.match_count += 1
                tutor.match_count += 1
                student.save
                tutor.save
                break
              else
                puts "#{new_match.message}"
                next
              end
            end
          end
        when "NT_level"
          # Define student subjects array
          @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
          # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
          # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
          if !tutor.subjects['secondary_subjects'].nil? && (@student_subject_array & tutor.subjects['secondary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
            @intersection = []
            # Shuffle to ensure all subjects get a chance to be matched
            @student_subject_array.shuffle.each do |subject|
              # This checks if student is already matched for an particular subject
              if Match.where(student_id: student.id, subject_matched: subject).any?
                next
              else
                @intersection << subject if tutor.subjects['secondary_subjects'].include? subject and subject.present?
              end
            end
            # Check if match already exists, if it does, continue the loop with the next student
            if Match.where(student_id: student.id, tutor_id: tutor.id, subject_matched: @intersection.first).any? or @intersection.first.nil?
              next
            else
              # Increase student count by 1 as we are only matching once
              student.match_count += 1
              tutor.match_count += 1
              student.save
              tutor.save
              new_match = GenerateMatchesService.new(student, tutor, @intersection.first).run
              # Stop student loop if new match is found for tutor as 1 tutor is assign to 1 student
              if new_match.success?
                # Increase student count by 1 as we are only matching once
                student.match_count += 1
                tutor.match_count += 1
                student.save
                tutor.save
                break
              else
                puts "#{new_match.message}"
                next
              end
            end
          end
        when "NA_level"
          # Define student subjects array
          @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
          # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
          # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
          if !tutor.subjects['secondary_subjects'].nil? && (@student_subject_array & tutor.subjects['secondary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
            @intersection = []
            # Shuffle to ensure all subjects get a chance to be matched
            @student_subject_array.shuffle.each do |subject|
              # This checks if student is already matched for an particular subject
              if Match.where(student_id: student.id, subject_matched: subject).any?
                next
              else
                @intersection << subject if tutor.subjects['secondary_subjects'].include? subject and subject.present?
              end
            end
            # Check if match already exists, if it does, continue the loop with the next student
            if Match.where(student_id: student.id, tutor_id: tutor.id, subject_matched: @intersection.first).any? or @intersection.first.nil?
              next
            else
              # Increase student count by 1 as we are only matching once
              student.match_count += 1
              tutor.match_count += 1
              student.save
              tutor.save
              new_match = GenerateMatchesService.new(student, tutor, @intersection.first).run
              # Stop student loop if new match is found for tutor as 1 tutor is assign to 1 student
              if new_match.success?
                # Increase student count by 1 as we are only matching once
                student.match_count += 1
                tutor.match_count += 1
                student.save
                tutor.save
                break
              else
                puts "#{new_match.message}"
                next
              end
            end
          end
        when "O_level"
          # Define student subjects array
          @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
          # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
          # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
          if !tutor.subjects['secondary_subjects'].nil? && (@student_subject_array & tutor.subjects['secondary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
            @intersection = []
            # Shuffle to ensure all subjects get a chance to be matched
            @student_subject_array.shuffle.each do |subject|
              # This checks if student is already matched for an particular subject
              if Match.where(student_id: student.id, subject_matched: subject).any?
                next
              else
                @intersection << subject if tutor.subjects['secondary_subjects'].include? subject and subject.present?
              end
            end
            # Check if match already exists, if it does, continue the loop with the next student
            if Match.where(student_id: student.id, tutor_id: tutor.id, subject_matched: @intersection.first).any? or @intersection.first.nil?
              next
            else
              # Increase student count by 1 as we are only matching once
              student.match_count += 1
              tutor.match_count += 1
              student.save
              tutor.save
              new_match = GenerateMatchesService.new(student, tutor, @intersection.first).run
              # Stop student loop if new match is found for tutor as 1 tutor is assign to 1 student
              if new_match.success?
                # Increase student count by 1 as we are only matching once
                student.match_count += 1
                tutor.match_count += 1
                student.save
                tutor.save
                break
              else
                puts "#{new_match.message}"
                next
              end
            end
          end
        when "A_level"
          # Define student subjects array
          @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
          # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
          # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
          if !tutor.subjects['jc_subjects'].nil? && (@student_subject_array & tutor.subjects['jc_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
            @intersection = []
            # Shuffle to ensure all subjects get a chance to be matched
            @student_subject_array.shuffle.each do |subject|
              # This checks if student is already matched for an particular subject
              if Match.where(student_id: student.id, subject_matched: subject).any?
                next
              else
                # it would return @intersection = nil if it doesn't pass the condition, hence need to check @intersection.first.nil? below
                @intersection << subject if tutor.subjects['jc_subjects'].include? subject and subject.present?
              end
            end
            # Check if match already exists, if it does, continue the loop with the next student
            if Match.where(student_id: student.id, tutor_id: tutor.id, subject_matched: @intersection.first).any? or @intersection.first.nil?
              next
            else
              # Increase student count by 1 as we are only matching once
              student.match_count += 1
              tutor.match_count += 1
              student.save
              tutor.save
              new_match = GenerateMatchesService.new(student, tutor, @intersection.first).run
              # Stop student loop if new match is found for tutor as 1 tutor is assign to 1 student
              if new_match.success?
                # Increase student count by 1 as we are only matching once
                student.match_count += 1
                tutor.match_count += 1
                student.save
                tutor.save
                break
              else
                puts "#{new_match.message}"
                next
              end
            end
          end
        end
      end
    end
  end
end
