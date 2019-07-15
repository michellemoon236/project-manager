class ApplicationController < ActionController::Base

  def home
    redirect_to projects_path if user_signed_in?
  end

end
