class RepresentantsController < ApplicationController
  def show
    @representante = current_user.representants.first
  end
  
  def edit
    @representante = Representant.find(params[:id])
  end
  
  def update
    @representante = Representant.find(params[:id])
    if @representante.update_attributes(params[:representant])
      flash[:notice] = "Dados Atualizados com sucesso!"
      redirect_to representante_representant_path(@representante)
    else
      render :action => 'edit'
    end
  end
end
