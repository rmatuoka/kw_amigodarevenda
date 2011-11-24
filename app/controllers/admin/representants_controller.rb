class Admin::RepresentantsController < ApplicationController
  layout "admin"
  before_filter :load_users, :except => [:show, :index]  
  
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
      redirect_to admin_representant_path(@representant)
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
      redirect_to admin_representant_path(@representant)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @representant = Representant.find(params[:id])
    @representant.destroy
    flash[:notice] = "Successfully destroyed representant."
    redirect_to admin_representants_path
  end
  
  protected  
  def load_users  
    @users = User.all.collect { |c| [c.username, c.id] }  
  end
end
