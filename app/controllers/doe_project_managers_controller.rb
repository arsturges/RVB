class DoeProjectManagersController < ApplicationController
  # GET /doe_project_managers
  # GET /doe_project_managers.xml
  def index
    @doe_project_managers = DoeProjectManager.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @doe_project_managers }
    end
  end

  # GET /doe_project_managers/1
  # GET /doe_project_managers/1.xml
  def show
    @doe_project_manager = DoeProjectManager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doe_project_manager }
    end
  end

  # GET /doe_project_managers/new
  # GET /doe_project_managers/new.xml
  def new
    @doe_project_manager = DoeProjectManager.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doe_project_manager }
    end
  end

  # GET /doe_project_managers/1/edit
  def edit
    @doe_project_manager = DoeProjectManager.find(params[:id])
  end

  # POST /doe_project_managers
  # POST /doe_project_managers.xml
  def create
    @doe_project_manager = DoeProjectManager.new(params[:doe_project_manager])

    respond_to do |format|
      if @doe_project_manager.save
        flash[:notice] = 'DoeProjectManager was successfully created.'
        format.html { redirect_to(@doe_project_manager) }
        format.xml  { render :xml => @doe_project_manager, :status => :created, :location => @doe_project_manager }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @doe_project_manager.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /doe_project_managers/1
  # PUT /doe_project_managers/1.xml
  def update
    @doe_project_manager = DoeProjectManager.find(params[:id])

    respond_to do |format|
      if @doe_project_manager.update_attributes(params[:doe_project_manager])
        flash[:notice] = 'DoeProjectManager was successfully updated.'
        format.html { redirect_to(@doe_project_manager) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @doe_project_manager.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /doe_project_managers/1
  # DELETE /doe_project_managers/1.xml
  def destroy
    @doe_project_manager = DoeProjectManager.find(params[:id])
    @doe_project_manager.destroy

    respond_to do |format|
      format.html { redirect_to(doe_project_managers_url) }
      format.xml  { head :ok }
    end
  end
end
