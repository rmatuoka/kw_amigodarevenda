class Admin::ResellersController < ApplicationController
  layout "admin"
  
  def index
    @resellers = Reseller.all
  end
  
  def show
    @reseller = Reseller.find(params[:id])
  end
  
  def new
    @reseller = Reseller.new
  end
  
  def create
    @reseller = Reseller.new(params[:reseller])
    if @reseller.save
      flash[:notice] = "Successfully created reseller."
      redirect_to admin_resellers_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @reseller = Reseller.find(params[:id])
  end
  
  def update
    @reseller = Reseller.find(params[:id])
    if @reseller.update_attributes(params[:reseller])
      flash[:notice] = "Successfully updated reseller."
      redirect_to admin_resellers_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @reseller = Reseller.find(params[:id])
    @reseller.destroy
    flash[:notice] = "Successfully destroyed reseller."
    redirect_to admin_resellers_path
  end
end
