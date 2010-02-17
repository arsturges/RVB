class DateCategoriesController < ApplicationController
  # GET /date_categories
  # GET /date_categories.xml
  def index
    @date_categories = DateCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @date_categories }
    end
  end

  # GET /date_categories/1
  # GET /date_categories/1.xml
  def show
    @date_category = DateCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @date_category }
    end
  end

  # GET /date_categories/new
  # GET /date_categories/new.xml
  def new
    @date_category = DateCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @date_category }
    end
  end

  # GET /date_categories/1/edit
  def edit
    @date_category = DateCategory.find(params[:id])
  end

  # POST /date_categories
  # POST /date_categories.xml
  def create
    @date_category = DateCategory.new(params[:date_category])

    respond_to do |format|
      if @date_category.save
        flash[:notice] = 'DateCategory was successfully created.'
        format.html { redirect_to(@date_category) }
        format.xml  { render :xml => @date_category, :status => :created, :location => @date_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @date_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /date_categories/1
  # PUT /date_categories/1.xml
  def update
    @date_category = DateCategory.find(params[:id])

    respond_to do |format|
      if @date_category.update_attributes(params[:date_category])
        flash[:notice] = 'DateCategory was successfully updated.'
        format.html { redirect_to(@date_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @date_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /date_categories/1
  # DELETE /date_categories/1.xml
  def destroy
    @date_category = DateCategory.find(params[:id])
    @date_category.destroy

    respond_to do |format|
      format.html { redirect_to(date_categories_url) }
      format.xml  { head :ok }
    end
  end
end
