namespace :scheduler do
  desc "this task is to schedule matching to match student and tutor into a classroom"
  task matching_existing_data: :environment do
    # Look for all the students that were not matched, in ascending order of ID
    Student.where(matched: false).each do |student|
      # Look for form 1 student
      if student.imported_data == "Existing student form 1"
        @intersection = []
        case student.existing_educational_level_data
        # when "PSLE (Primary School)"
        #   # add counter so that we restrict the iteration to break at 2-3 matches
        #   i = 0
        #   Tutor.where(matched: false).each do |tutor|
        #     # Check if tutor indicated primary subjects
        #     # Check for intersection of the subject between tutor and student; The regexp is to split the column details into an array of strings and then intersection to match the 2 arrays
        #     # Check if counter is less than 2 (because dont want to overmatch the student, maximum 2 matches!)
        #     if !tutor.subjects['primary_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
        #       # Create matches here! the join method makes the array into a single string, separated by commas. Eg ["math", "english"] => "math, english"
        #       @intersection = (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).join(', ')
        #       # Generate matches through the service
        #       GenerateMatchesService.new(student, tutor, @intersection).run
        #       # increase counter by 1
        #       i += 1
        #     end
        #   end
        # when "GCSE N(T)-Level"
        #   i = 0
        #   Tutor.where(matched: false).each do |tutor|
        #     if !tutor.subjects['nt_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['nt_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
        #       @intersection = (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['nt_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).join(', ')
        #       GenerateMatchesService.new(student, tutor, @intersection).run
        #       i += 1
        #     end
        #   end
        # when "GCSE N(A)-Level"
        #   i = 0
        #   Tutor.where(matched: false).each do |tutor|
        #     if !tutor.subjects['na_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['na_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
        #       @intersection = (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['na_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).join(', ')
        #       GenerateMatchesService.new(student, tutor, @intersection).run
        #       i += 1
        #     end
        #   end
        # when "GCSE O-Level"
        #   i = 0
        #   Tutor.where(matched: false).each do |tutor|
        #     if !tutor.subjects['o_subjects'].nil? && (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present? && i < 2
        #       @intersection = (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['o_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).join(', ')
        #       GenerateMatchesService.new(student, tutor, @intersection).run
        #       i += 1
        #     end
        #   end
        when "GCSE A-Level"
          Tutor.where(matched: false).each do |tutor|
            # Check that other subjects (except A level) are false
            if tutor.subjects['primary_subjects'].nil? && tutor.subjects['nt_subjects'].nil? && tutor.subjects['na_subjects'].nil? && tutor.subjects['o_subjects'].nil?
              @intersection = []
              student.subject_preferences.each do |key, value|
                # Initialize intersection as an array
                # Check if the key's value for both student and tutor exists
                if tutor.subjects['a_subjects'][key].present? and student.subject_preferences[key].present?
                  # Check if tutor subject is included in student. THis is because tutor data could be "H1, H2". TO CHECK if student "H1" is included! Capitalize it for consistency
                  if tutor.subjects['a_subjects'][key].capitalize().include? student.subject_preferences[key].capitalize()
                    @intersection << key      
                  end
                end
              end
              # Join the array into string after checking if intersection is not empty
              GenerateMatchesService.new(student, tutor, @intersection.join(', ')).run if @intersection.any?
            end
          end
        end
      end
    end
  end
end
