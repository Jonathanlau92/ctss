namespace :scheduler do
  desc "this task is to schedule matching to match student and tutor into a classroom"
  task matching_existing_data: :environment do
    # Look for all the students that were not matched, in ascending order of ID
    Student.where(matched: false).each do |student|
      # .split(/,\s*(?=[^()]*(?:\(|$))/)
      # Look for form 1 student
      if student.imported_data == "Existing student form 1"
        @intersection = []
        case student.existing_educational_level_data
        when "PSLE (Primary School)"
          # add counter so that we restrict the iteration to break at 2-3 matches
          i = 0
          Tutor.where(matched: false).each do |tutor|
            # if tutor indicated primary subjects
            if !tutor.subjects['primary_subjects'].nil? and i < 2
              # Check for intersection of the subject between tutor and student
              if (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).present?
                # Create matches here! the join method makes the array into a single string, separated by commas. Eg ["math", "english"] => "math, english"
                @intersection = (student.subject_1.split(/,\s*(?=[^()]*(?:\(|$))/) & tutor.subjects['primary_subjects'].split(/,\s*(?=[^()]*(?:\(|$))/)).join(', ')
                # Generate matches through the service
                GenerateMatchesService.new(student, tutor, @intersection).run
              end
            end
          end
        when "GCSE N(T)-Level"
        when "GCSE N(A)-Level"
        when "GCSE O-Level"
        when "GCSE A-Level"
        end
      end
    end
  end
end
