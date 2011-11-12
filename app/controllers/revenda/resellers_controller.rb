class Revenda::ResellersController < ApplicationController
  def index
    
  end
  
  def show
    @reseller = Reseller.find(params[:id])
  end
end
