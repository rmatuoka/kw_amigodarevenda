class NoticiasController < ApplicationController
  def index
    @noticias = Notice.todas_publicadas
  end
  def show
    @noticia = Notice.find(params[:id])  
  end
end

