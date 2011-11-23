class ProductRequestsController < ApplicationController
  def index
    @pedidos = current_user.product_requests.all
  end
  
  def show
    @pedido = current_user.product_requests.find(params[:id])
    @produtos = @pedido.product_request_items.all
  end
end
