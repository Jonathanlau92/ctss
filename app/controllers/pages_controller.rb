class PagesController < ApplicationController
  def home
    
  end

  def student_ending_page

  end

  def tutor_ending_page

  end

  def student_extension_notice

  end

  def tutor_extension_notice
    
  end

  def match_search
    @matches = Match.search(params[:search])
  end
end
