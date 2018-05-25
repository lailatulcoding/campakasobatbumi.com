class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :set_paper_trail_whodunnit
  protect_from_forgery with: :null_session
end
