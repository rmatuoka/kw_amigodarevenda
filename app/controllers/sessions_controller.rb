class SessionsController < ApplicationController
  def index
    render :action => "new"
  end

  def create
    @reseller = Reseller.first(:conditions => ['email = ? AND senha = ?', params[:email], params[:senha]])
    if @reseller
      session[:logged] = true
      session[:id] = @reseller.id
      redirect_to home_path
    else
      flash[:notice] = "Usuário e senha inválidos."
      redirect_to sessions_path
    end
  end

  def destroy
    session[:logged] = false
    redirect_to new_session_path
  end

end
