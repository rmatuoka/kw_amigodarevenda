class ProductRequestsController < ApplicationController
  def index
    @pedidos = current_user.product_requests.all
  end
end
