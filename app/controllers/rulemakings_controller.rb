class RulemakingsController < ApplicationController
  # GET /rulemakings
  # GET /rulemakings.xml
   before_filter :admin_filter, :except => [:index, :show]

  def index
    @rulemakings = Rulemaking.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rulemakings }
    end
  end

  # GET /rulemakings/1
  # GET /rulemakings/1.xml
  def show
    @rulemaking = Rulemaking.find(params[:id])
    @milestones = @rulemaking.milestones

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rulemaking }
    end
  end


  # GET /rulemakings/new
  # GET /rulemakings/new.xml
  def new
    @rulemaking = Rulemaking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rulemaking }
    end
  end

  # GET /rulemakings/1/edit
  def edit
    @rulemaking = Rulemaking.find(params[:id])
  end

  # POST /rulemakings
  # POST /rulemakings.xml
  def create
    @rulemaking = Rulemaking.new(params[:rulemaking])

    respond_to do |format|
      if @rulemaking.save
        flash[:notice] = 'Rulemaking was successfully created.'
        format.html { redirect_to(@rulemaking) }
        format.xml  { render :xml => @rulemaking, :status => :created, :location => @rulemaking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rulemaking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rulemakings/1
  # PUT /rulemakings/1.xml
  def update
    @rulemaking = Rulemaking.find(params[:id])

    respond_to do |format|
      if @rulemaking.update_attributes(params[:rulemaking])
        flash[:notice] = 'Rulemaking was successfully updated.'
        format.html { redirect_to(@rulemaking) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rulemaking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rulemakings/1
  # DELETE /rulemakings/1.xml
  def destroy
    @rulemaking = Rulemaking.find(params[:id])
    @rulemaking.destroy

    respond_to do |format|
      format.html { redirect_to(rulemakings_url) }
      format.xml  { head :ok }
    end
  end



end
