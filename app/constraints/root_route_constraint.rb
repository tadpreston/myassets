class RootRouteConstraint

  def matches?(request)
    request.session[:current_user_id].present?
  end
end
