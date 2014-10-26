class Api::BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :user_signed_in?
  
  def render_errors(errors)
    @errors = errors unless errors.blank?
    template = "shared/errors"
    render :json, template: template, layout: 'failure'
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    redirect_to intro_url unless current_user
  end
end
