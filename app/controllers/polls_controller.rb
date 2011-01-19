class PollsController < ApplicationController
    
  def edit
    @poll = Poll.find(params[:id])
    @poll_question = PollQuestion.find(params[:question]);
    
    if !@poll_question.blank?
      #Atualiza voto
      if @poll_question.total_votes.blank?
        @poll_question.total_votes = 0
      end
      
      #verifica se está em branco
      @poll_question.total_votes += 1
      
      if @poll_question.save
        #salvou
        cookies[:poll] = "true"
        cookies[:poll_id] = params[:id]
        redirect_to home_path
      end
    end
  end
  
  def resultado
    cookies[:ver_resultado] = "true"
  end
  
end
