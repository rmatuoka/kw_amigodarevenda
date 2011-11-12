class Representante::HomeController < ApplicationController
  #before_filter :carrega_info
  
  access_control do
    allow :representante, :to => [:index]
  end
  
  def index
    @offer = Offer.get_promocao
    @noticias = Notice.todas_publicadas
    @pedidos = current_user.product_requests.all
  end
end
