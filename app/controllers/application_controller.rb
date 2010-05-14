# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
   filter_parameter_logging :password, :password_confirmation

  include AuthenticatedSystem #this comes from the restful_authentication plugin
  layout 'application'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # uncomment the next line to enable authentication. See also sessions_controller.
  before_filter :login_required

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  #for views
  def admin?
    @current_user.admin?
  end
  helper_method :admin?

  #for controller actions
  def admin_filter
    unless admin?
      flash[:warning] = "You must be an admin to access that page."
      redirect_to root_path
      return false
    end
  end
end