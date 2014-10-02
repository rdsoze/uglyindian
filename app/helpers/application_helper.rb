module ApplicationHelper
  def is_active_nav?(controller, action)
    'active' if params[:controller] == controller && params[:action] == action
  end
end
