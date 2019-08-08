class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :require_login

  private

  def current_user
    @current_user || User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def require_login
    redirect_to sessions_new_url, alert: "Not Authorized!" unless current_user
  end
end
