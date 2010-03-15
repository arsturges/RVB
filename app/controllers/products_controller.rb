class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])


      if @product.save
        flash[:notice] = 'Product was successfully created.'
      else
         render :action => "new"
      end
    end


  def update
    @product = Product.find(params[:id])


      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
      else
       render :action => "edit"
      end
    end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

end
