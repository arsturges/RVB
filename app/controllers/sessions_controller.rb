# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  #uncomment the next line to enable authentication.
  skip_before_filter :login_required

  # render new.rhtml
  def new
  end

  def create
    # from http://guides.rubyonrails.org/security.html:
    # If you use the popular RestfulAuthentication plugin for user management,
    # add reset_session to the SessionsController#create action.
    # Note that this removes any value from the session, you have
    # to transfer them to the new session.
    # reset_session # note that this also appears in users_controller.rb with a note.

    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default('/')
      flash[:notice] = "Logged in successfully"
    else
      flash[:notice] = "Invalid login credentials."
      # flash.now[:error] = "Invalid login credentials." # this was recommended by rbates in rails. Don't know why it doesn't work.
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
