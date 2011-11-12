class Admin::DownloadsController < ApplicationController
  layout "admin"
  def index
    @downloads = Download.all
  end
  
  def show
    @download = Download.find(params[:id])
  end
  
  def new
    @download = Download.new
  end
  
  def create
    @download = Download.new(params[:download])
    if @download.save
      flash[:notice] = "Successfully created download."
      redirect_to admin_downloads_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @download = Download.find(params[:id])
  end
  
  def update
    @download = Download.find(params[:id])
    if @download.update_attributes(params[:download])
      flash[:notice] = "Successfully updated download."
      redirect_to admin_downloads_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @download = Download.find(params[:id])
    @download.destroy
    flash[:notice] = "Successfully destroyed download."
    redirect_to admin_downloads_path
  end
end
