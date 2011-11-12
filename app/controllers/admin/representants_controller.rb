class Admin::RepresentantsController < ApplicationController
  def index
    @representants = Representant.all
  end
  
  def show
    @representant = Representant.find(params[:id])
  end
  
  def new
    @representant = Representant.new
  end
  
  def create
    @representant = Representant.new(params[:representant])
    if @representant.save
      flash[:notice] = "Successfully created representant."
      redirect_to @representant
    else
      render :action => 'new'
    end
  end
  
  def edit
    @representant = Representant.find(params[:id])
  end
  
  def update
    @representant = Representant.find(params[:id])
    if @representant.update_attributes(params[:representant])
      flash[:notice] = "Successfully updated representant."
      redirect_to @representant
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @representant = Representant.find(params[:id])
    @representant.destroy
    flash[:notice] = "Successfully destroyed representant."
    redirect_to representants_url
  end
end
