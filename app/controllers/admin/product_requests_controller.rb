class Admin::ProductRequestsController < ApplicationController
  layout "admin"
  before_filter :load_data, :except => [:show, :index]  
  
  def index
    @product_requests = ProductRequest.all
  end

  def show
    @product_request = ProductRequest.find(params[:id])
  end

  def new
    @product_request = ProductRequest.new
  end

  def create
    @product_request = ProductRequest.new(params[:product_request])
    if @product_request.save
      redirect_to [:admin, @product_request], :notice => "Successfully created product request."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_request = ProductRequest.find(params[:id])
  end

  def update
    @product_request = ProductRequest.find(params[:id])
    if @product_request.update_attributes(params[:product_request])
      redirect_to [:admin, @product_request], :notice  => "Successfully updated product request."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_request = ProductRequest.find(params[:id])
    @product_request.destroy
    redirect_to admin_product_requests_url, :notice => "Successfully destroyed product request."
  end
  
  protected  
  def load_data
    @users = User.all.collect { |c| [c.username, c.id] }
    @transportadoras = Transporter.all.collect { |c| [c.nome, c.id] }
    @revendas = Reseller.all.collect { |c| [c.nome, c.id] } 
  end
end
