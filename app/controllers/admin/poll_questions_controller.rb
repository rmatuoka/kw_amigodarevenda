class Admin::PollQuestionsController < ApplicationController
  layout "admin"
  
  before_filter :load_poll
  def index
    @poll_questions = PollQuestion.all
  end
  
  def show
    @poll_question = PollQuestion.find(params[:id])
  end
  
  def new
    @poll_question = PollQuestion.new
  end
  
  def create
    @poll_question = PollQuestion.new(params[:poll_question])
    if @poll_question.save
      flash[:notice] = "Successfully created poll question."
      redirect_to poll_poll_question_path(@poll, @poll_question)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @poll_question = PollQuestion.find(params[:id])
  end
  
  def update
    @poll_question = PollQuestion.find(params[:id])
    if @poll_question.update_attributes(params[:poll_question])
      flash[:notice] = "Successfully updated poll question."
      redirect_to poll_poll_question_path(@poll, @poll_question)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @poll_question = PollQuestion.find(params[:id])
    @poll_question.destroy
    flash[:notice] = "Successfully destroyed poll question."
    redirect_to poll_poll_questions_url(@poll)
  end
  
  
  def load_poll
    @poll = Poll.find(params[:poll_id])    
  end
end
