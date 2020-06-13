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
    if @student.match_count > 4
      @student.matched = true
      @student.save
    end
    if @tutor.match_count === 1
      @tutor.matched = true
      @tutor.save
    end
  end
end
