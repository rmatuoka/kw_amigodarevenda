class Admin::UpdatesController < ApplicationController
  layout "admin"
  def index
    @updates = Update.all
  end
  
  def show
    @update = Update.find(params[:id])
  end
  
  def new
    @update = Update.new
  end
  
  def create
    @update = Update.new(params[:update])
    if @update.save
      flash[:notice] = "Successfully created update."
      redirect_to admin_updates_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @update = Update.find(params[:id])
  end
  
  def update
    @update = Update.find(params[:id])
    if @update.update_attributes(params[:update])
      flash[:notice] = "Successfully updated update."
      redirect_to admin_updates_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @update = Update.find(params[:id])
    @update.destroy
    flash[:notice] = "Successfully destroyed update."
    redirect_to admin_updates_path
  end
end
