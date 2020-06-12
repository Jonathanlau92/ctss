namespace :existing_matching do
end
  # desc "this task is to schedule matching to match student and tutor"
  # task matching_existing_data_form1: :environment do
  #   # Look for all the students that were not matched and in form 1, in ascending order of ID
  #   Student.where(matched: false, imported_data: "Existing student form 1").each do |student|
  #     case student.existing_educational_level_data
  #     when "PSLE (Primary School)"
  #       # add counter so that we restrict the iteration to break at 2-3 matches
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         # Check if tutor indicated primary subjects
  #         # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
  #         # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
  #         if !tutor.subjects['primary_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           # Loop through individual subject and check if it's included in tutor subject preferences. if it is, push subject to array
  #           student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/).each do |subject|
  #             if tutor.subjects['primary_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           # Create matches here! the join method makes the array into a single string, separated by commas. Eg ["math", "english"] => "math, english"
  #           # @intersection = (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).join(', ')
  #           # Generate matches through the service
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           # increase counter by 1
  #           i += 1
  #         end
  #       end
  #     when "GCSE N(T)-Level"
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         if !tutor.subjects['nt_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['nt_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/).each do |subject|
  #             if tutor.subjects['nt_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           i += 1
  #         end
  #       end
  #     when "GCSE N(A)-Level"
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         if !tutor.subjects['na_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['na_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/).each do |subject|
  #             if tutor.subjects['na_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           i += 1
  #         end
  #       end
  #     when "GCSE O-Level"
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         if !tutor.subjects['o_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/).each do |subject|
  #             if tutor.subjects['o_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           # @intersection = (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).join(', ')
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           i += 1
  #         end
  #       end
  #     when "GCSE A-Level"
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         # Check that other subjects (except A level) are false
  #         if i < 2 && tutor.subjects['primary_subjects'].nil? && tutor.subjects['nt_subjects'].nil? && tutor.subjects['na_subjects'].nil? && tutor.subjects['o_subjects'].nil?
  #           # Initialize intersection as an array
  #           @intersection = []
  #           student.subject_preferences.each do |key, value|
  #             # Check if the key's value for both student and tutor exists
  #             if tutor.subjects['a_subjects'][key].present? and student.subject_preferences[key].present?
  #               # Check if tutor subject is included in student. THis is because tutor data could be "H1, H2". TO CHECK if student "H1" is included! Capitalize it for consistency
  #               if tutor.subjects['a_subjects'][key].capitalize().include? student.subject_preferences[key].capitalize()
  #                 @intersection << key
  #                 i += 1
  #               end
  #             end
  #           end
  #           # Join the array into string after checking if intersection is not empty
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run if @intersection.any?
  #         end
  #       end
  #     end
  #   end
  # end

  # task matching_existing_data_form2: :environment do
  #   # Look for all the students that were not matched, in ascending order of ID
  #   Student.where(matched: false, imported_data: "Existing student form 2").each do |student|
  #     case student.existing_educational_level_data
  #     when "Primary School"
  #       # add counter so that we restrict the iteration to break at 2-3 matches
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         # Define student subjects array
  #         @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
  #         # Check if tutor indicated primary subjects
  #         # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
  #         # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
  #         if !tutor.subjects['primary_subjects'].nil? && (@student_subject_array & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           @student_subject_array.each do |subject|
  #             if tutor.subjects['primary_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           # Generate matches through the service
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           # increase counter by 1
  #           i += 1
  #         end
  #       end
  #     end
  #     when "Secondary N(T)-Level"
  #       # add counter so that we restrict the iteration to break at 2-3 matches
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         # Define student subjects array
  #         @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
  #         # Check if tutor indicated primary subjects
  #         # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
  #         # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
  #         if !tutor.subjects['nt_subjects'].nil? && (@student_subject_array & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           @student_subject_array.each do |subject|
  #             if tutor.subjects['nt_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           # Generate matches through the service
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           # increase counter by 1
  #           i += 1
  #         end
  #       end
  #     end
  #     when "Secondary N(A)-Level"
  #       # add counter so that we restrict the iteration to break at 2-3 matches
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         # Define student subjects array
  #         @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
  #         # Check if tutor indicated primary subjects
  #         # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
  #         # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
  #         if !tutor.subjects['na_subjects'].nil? && (@student_subject_array & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           @student_subject_array.each do |subject|
  #             if tutor.subjects['na_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           # Generate matches through the service
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           # increase counter by 1
  #           i += 1
  #         end
  #       end
  #     end
  #     when ("Secondary O-Level" or "GCSE O-Level" or "GCSE O-Level")
  #       # add counter so that we restrict the iteration to break at 2-3 matches
  #       i = 0
  #       Tutor.where(matched: false).each do |tutor|
  #         # Define student subjects array
  #         @student_subject_array = [student.subject_1, student.subject_2, student.subject_3]
  #         # Check if tutor indicated primary subjects
  #         # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
  #         # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
  #         if !tutor.subjects['o_subjects'].nil? && (@student_subject_array & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
  #           # Initialize intersection as an array
  #           @intersection = []
  #           @student_subject_array.each do |subject|
  #             if tutor.subjects['o_subjects'].include? subject
  #               @intersection << subject
  #             end
  #           end
  #           # Generate matches through the service
  #           GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run
  #           # increase counter by 1
  #           i += 1
  #         end
  #       end
  #     end

  #   end
  # end
