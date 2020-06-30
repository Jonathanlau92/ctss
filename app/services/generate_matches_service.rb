class GenerateMatchesService
  def initialize(student, tutor, subject)
    @student = student
    @tutor = tutor
    @subject = subject
  end

  def run
    begin
      create_match
      update_student_and_tutor_matched_status
      @m.save!
      OpenStruct.new(success?: true, match: @m)
    rescue => e
      OpenStruct.new(success?: false, match: @m, message: e.message)
    end
  end

  private
  def create_match
    @m = Match.new
    @m.student = @student
    @m.tutor = @tutor
    @m.subject_matched = @subject
  end

  def update_student_and_tutor_matched_status
    if @student.match_count > 3
      @student.matched = true
    else
      @student.match_count += 1
    end
    @student.save
    # If tutor match count is 1 or less, increase match count and set status to true
    if @tutor.match_count < 2
      @tutor.match_count += 1
      @tutor.matched = true
      @tutor.save
    end
  end
end
