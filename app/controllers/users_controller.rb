class UsersController < ApplicationController
  # render new.rhtml
  before_filter :admin_filter, :except => [:edit, :update]
  before_filter :get_user, :only => [:edit, :update]

  def new
    @user = User.new
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

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      if current_user.admin? && current_user != @user #think more about user privileges policy later
        @user.update_attribute(:admin,  params[:user][:admin])
      end
      flash[:notice] = "User changes for " + @user.login + " were successfully saved."
      redirect_to '/'
    else
      render 'edit'
    end
  end

  protected
  def get_user
    @user = current_user.admin? ? User.find(params[:id]) : current_user
  end
end
