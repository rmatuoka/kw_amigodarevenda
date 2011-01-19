class NoticiasController < ApplicationController
  before_filter :autentica
  
  def show
    @noticia = Notice.find(params[:id])  
  end
  
  def autentica
    if session[:logged]
       @reseller = Reseller.find(session[:id])
      true
    else
      flash[:notice] = "Sua sessão expirou, faça o login para continuar."
      redirect_to sessions_path
    end
  end
end

