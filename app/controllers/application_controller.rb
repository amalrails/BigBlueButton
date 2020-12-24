class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def new_session_path *args
    new_user_session_path *args
  end
end
