class ApplicationController < ActionController::Base
  helper :all 
  protect_from_forgery
  
  helper_method :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  rescue_from 'Acl9:AccessDenied', :with => :access_denied
  
  def access_denied
    if current_user
      render :template => 'negado'
    else
      redirect_to login_path, :notice => "Acesso Negado. Você precisa estar logado!"
    end
  end
end
