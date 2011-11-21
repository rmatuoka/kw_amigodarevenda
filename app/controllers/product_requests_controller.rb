class ProductRequestsController < ApplicationController
  def index
    @pedidos = current_user.product_requests.all
  end
  
  def show
    @pedido = current_user.product_requests.find(params[:id])
  end
end
