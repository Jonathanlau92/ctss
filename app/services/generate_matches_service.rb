class GenerateMatchesService
  def initialize(student, tutor, subject)
    @student = student
    @tutor = tutor
    @subject = subject
  end

  def run
    create_match
    # update_student_and_tutor_matched_status
  end

  private
  def create_match
    m = Match.new
    m.student = @student
    m.tutor = @tutor
    m.subject_matched = @subject
    m.save
  end

  def update_student_and_tutor_matched_status
    @student.matched = true
    @student.save
    @tutor.matched = true
    @tutor.save
  end
end
