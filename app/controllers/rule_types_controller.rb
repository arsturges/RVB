class RuleTypesController < ApplicationController
  # GET /rule_types
  # GET /rule_types.xml
  before_filter :admin_filter, :except => [:index, :show]

  def index
    @rule_types = RuleType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rule_types }
    end
  end

  # GET /rule_types/1
  # GET /rule_types/1.xml
  def show
    @rule_type = RuleType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rule_type }
    end
  end

  # GET /rule_types/new
  # GET /rule_types/new.xml
  def new
    @rule_type = RuleType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rule_type }
    end
  end

  # GET /rule_types/1/edit
  def edit
    @rule_type = RuleType.find(params[:id])
  end

  # POST /rule_types
  # POST /rule_types.xml
  def create
    @rule_type = RuleType.new(params[:rule_type])

    respond_to do |format|
      if @rule_type.save
        flash[:notice] = 'RuleType was successfully created.'
        format.html { redirect_to(@rule_type) }
        format.xml  { render :xml => @rule_type, :status => :created, :location => @rule_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rule_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rule_types/1
  # PUT /rule_types/1.xml
  def update
    @rule_type = RuleType.find(params[:id])

    respond_to do |format|
      if @rule_type.update_attributes(params[:rule_type])
        flash[:notice] = 'RuleType was successfully updated.'
        format.html { redirect_to(@rule_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rule_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rule_types/1
  # DELETE /rule_types/1.xml
  def destroy
    @rule_type = RuleType.find(params[:id])
    @rule_type.destroy

    respond_to do |format|
      format.html { redirect_to(rule_types_url) }
      format.xml  { head :ok }
    end
  end
end
