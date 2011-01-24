class CategoriesController < ApplicationController
  before_filter :autentica
  
  def index
    #Categorias
    @categorias = Category.all
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
