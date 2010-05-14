class RulemakingsController < ApplicationController

   before_filter :admin_filter, :except => [:index, :show]

  def index
    params[:search] ||= {}
    params[:search][:order] ||= 'ascend_by_short_name'
    @search = Rulemaking.search(params[:search])
    #raise @search.inspect
    @rulemakings =  @search.all(:include => [:rule_type, :doe_project_manager, :phase, :activity])
    #raise params[:search].inspect
  end

  def show
    @rulemaking = Rulemaking.find(params[:id]) 
    @revision_number = params[:revision_number] || Revision.maximum(:revision_number) #took out a to_i to fix this being set to 0. Will cause more problems?
    @milestones = @rulemaking.milestones.find(:all, :conditions=> {:revision_number => @revision_number})
    @contractors = @rulemaking.contractors
    @drivers = @rulemaking.drivers

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
    params[:rulemaking][:contractor_ids] ||= []
    params[:rulemaking][:driver_ids] ||= []
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

  def assign_products
    @rulemaking = Rulemaking.find(params[:id])
    @products = @rulemaking.products
  end

  def save_products
    @rulemaking = Rulemaking.find(params[:id])
     current_product_ids = @rulemaking.products.collect {|product| product.id.to_s}
     products_to_remove = current_product_ids - params[:products]
     Product.update_all("rulemaking_id = null", :id => products_to_remove)
     Product.update_all("rulemaking_id = #{@rulemaking.id}", :id => params[:products])
     redirect_to :action => :show
  end
end
