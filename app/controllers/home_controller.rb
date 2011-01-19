class HomeController < ApplicationController
  before_filter :autentica
  def index
    #CARREGA PESQUISAS
    @poll = Poll.first(:conditions => ['published = 1'])
    @poll_questions = @poll.poll_questions.all(:conditions => ['published = true'])
    
    #CARREGA NOTICIAS
    @notices = Notice.all(:conditions => ['published = 1'])
    
    #CARREGA PROMOÇÕES
    @offer = Offer.first(:conditions => ['published = 1'])
    
    #PESQUISAS
    if cookies[:poll] == "true"
      @poll = Poll.find(cookies[:poll_id])
      @poll_questions = @poll.poll_questions.all(:conditions => ['published = true'])
      @total_votes = @poll.poll_questions.sum(:total_votes)
      @resultado = Array.new
      
      @poll_questions.each do |q|
      @porcentagem = ((q.total_votes.to_f / @total_votes.to_f) * 100).round(2)
      
      @out = q.question + "<br>"
      @out += "<div style='width:"+ @porcentagem.to_s + "%;' class='progress_poll'>"
      @out +=  "<p style='margin-left:3px;'>" + @porcentagem.to_s + "% </p>"
      @out += "</div>"
      @resultado.push @out
      end
    end
  end
  
  def autentica
    if session[:logged]
       @reseller = Reseller.find(session[:id])
      true
    else
      flash[:notice] = "Sua sessão expirou, faça o login para continuar."
      redirect_to sessions_path
    end
  end
end
