class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: ->{request.format.json?}
  before_action :set_paper_trail_whodunnit
end
