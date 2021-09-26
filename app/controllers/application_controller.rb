class ApplicationController < ActionController::Base


  def require_login
    unless current_user
        redirect_to new_admins_session_path, notice: 'Please sign in to get started!'
    end
  end
end
