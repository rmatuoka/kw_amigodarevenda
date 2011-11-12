class Revenda::HomeController < ApplicationController
  
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
    
    #PEDIDOS
    @pedidos = ProductRequest.all(:conditions => ['user_id = ?', session[:id]], :limit => 4)
  end
end
