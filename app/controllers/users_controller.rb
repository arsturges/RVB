class UsersController < ApplicationController
  # render new.rhtml
  before_filter :admin_filter, :except => []

  def new
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      #self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "New user has been created."
    else
      render :action => 'new'
    end
  end
end
