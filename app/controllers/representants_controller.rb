class RepresentantsController < ApplicationController
  def show
    @representante = current_user.representants.first
  end
end
