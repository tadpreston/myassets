class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:current_user_id] = user.id
      redirect_to spaces_path, notice: "Welcome Back!"
    else
      flash[:error] = "Could not log you in"
      redirect_to new_session_path
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url, notice: "You've successfully logged out!"
  end
end
