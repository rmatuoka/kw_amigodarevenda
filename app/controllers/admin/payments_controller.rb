class Admin::PaymentsController < ApplicationController
  layout "admin"
  
  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(params[:payment])
    if @payment.save
      redirect_to [:admin, @payment], :notice => "Successfully created payment."
    else
      render :action => 'new'
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(params[:payment])
      redirect_to [:admin, @payment], :notice  => "Successfully updated payment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    redirect_to admin_payments_url, :notice => "Successfully destroyed payment."
  end
end
