class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :require_login

  private

  def current_user
    @current_user || User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def require_login
    redirect_to new_session_path, alert: "Not Authorized!" unless current_user.present?
  end
end
