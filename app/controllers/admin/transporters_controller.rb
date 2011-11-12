class Admin::TransportersController < ApplicationController
  layout "admin"
  def index
    @transporters = Transporter.all
  end
  
  def show
    @transporter = Transporter.find(params[:id])
  end
  
  def new
    @transporter = Transporter.new
  end
  
  def create
    @transporter = Transporter.new(params[:transporter])
    if @transporter.save
      flash[:notice] = "Successfully created transporter."
      redirect_to admin_transporters_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @transporter = Transporter.find(params[:id])
  end
  
  def update
    @transporter = Transporter.find(params[:id])
    if @transporter.update_attributes(params[:transporter])
      flash[:notice] = "Successfully updated transporter."
      redirect_to admin_transporters_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @transporter = Transporter.find(params[:id])
    @transporter.destroy
    flash[:notice] = "Successfully destroyed transporter."
    redirect_to admin_transporters_path
  end
end
