class Revenda::CategoriesController < ApplicationController
  def index
    #Categorias
    @categorias = Category.all
  end
end
