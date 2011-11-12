class Admin::NoticesController < ApplicationController
  layout "admin"
  
  def index
    @notices = Notice.all
  end
  
  def show
    @notice = Notice.find(params[:id])
  end
  
  def new
    @notice = Notice.new
  end
  
  def create
    @notice = Notice.new(params[:notice])
    if @notice.save
      flash[:notice] = "Successfully created notice."
      redirect_to admin_notices_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @notice = Notice.find(params[:id])
  end
  
  def update
    @notice = Notice.find(params[:id])
    if @notice.update_attributes(params[:notice])
      flash[:notice] = "Successfully updated notice."
      redirect_to admin_notices_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    flash[:notice] = "Successfully destroyed notice."
    redirect_to admin_notices_path
  end
end
