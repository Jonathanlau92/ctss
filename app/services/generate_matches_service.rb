class GenerateMatchesService
  def initialize(student, tutor, subject)
    @student = student
    @tutor = tutor
    @subject = subject
  end

  def run
    create_match
  end

  private
  def create_match
    m = Match.new
    m.student = @student
    m.tutor = @tutor
    m.subject_matched = @subject
    m.save
  end
end
