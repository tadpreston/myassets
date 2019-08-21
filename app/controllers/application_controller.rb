class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized_response

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

  def not_authorized_response
    redirect_to root_url, error: 'You are not authorized to accesss this'
  end
end
