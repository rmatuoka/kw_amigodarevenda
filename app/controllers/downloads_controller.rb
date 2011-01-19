class DownloadsController < ApplicationController
  before_filter :autentica
  
  def index
    @downloads = Download.all(:conditions => ['published = 1'])
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
