class PagesController < ApplicationController
  def landing
  end

  def contact
    @feedback = Feedback.new
  end
end
