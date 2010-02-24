# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include AuthenticatedSystem #this comes from the restful_authentication plugin
  layout 'application'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # uncomment the next line to enable authentication. See also sessions_controller.
  before_filter :login_required

  # this may screw everything up. It may need to be in individual controllers.
  # May need to add an :except=>users or session or something.
  #before_filter :login_required, :except => [:login], :redirect_to => :login

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

#  rescue_from CanCan::AccessDenied do |exception|
#    flash[:error] = "Access denied."
#    redirect_to root_url
#  end

  def admin?
    current_user.admin?
  end
  helper_method :admin?

  def admin_filter
    unless admin?
      flash[:warning] = "Access denied for non-admins"
      redirect_to root_path
      return false
    end
  end


end