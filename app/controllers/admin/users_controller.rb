class Admin::UsersController < ApplicationController
  layout "admin"
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      @user.has_role! :user
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user), :notice  => "Dados Atualizados com sucesso!"
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, :notice => "Usuário Deletado com sucesso!"
  end

end
