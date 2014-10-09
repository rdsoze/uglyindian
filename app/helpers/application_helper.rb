module ApplicationHelper
  def is_active_nav?(controller, action)
    'active' if params[:controller] == controller && params[:action] == action
  end

  def login_check(next_path)
    (current_user)? next_path : "/auth/facebook?next=#{next_path}"
  end
end
