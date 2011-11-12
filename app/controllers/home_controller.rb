class HomeController < ApplicationController
  def index
    if current_user
      if current_user.has_role? :representante
        redirect_to representante_home_index_path
      end

      if current_user.has_role? :revendedor
        redirect_to revenda_home_index_path
      end

      if current_user.has_role? :admin
        redirect_to admin_downloads_path
      end
    else
      redirect_to login_path
    end
    
  end
end
