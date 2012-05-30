class Admin::CategoryResellerDiscountsController < ApplicationController
  layout "admin"
  before_filter :load_categories_resellers, :except => [:show, :index] 
  
  def index
    @category_reseller_discounts = CategoryResellerDiscount.all
  end

  def show
    @category_reseller_discount = CategoryResellerDiscount.find(params[:id])
  end

  def new
    @category_reseller_discount = CategoryResellerDiscount.new
  end

  def create
    @category_reseller_discount = CategoryResellerDiscount.new(params[:category_reseller_discount])
    if @category_reseller_discount.save
      redirect_to [:admin, @category_reseller_discount], :notice => "Successfully created category reseller discount."
    else
      render :action => 'new'
    end
  end

  def edit
    @category_reseller_discount = CategoryResellerDiscount.find(params[:id])
  end

  def update
    @category_reseller_discount = CategoryResellerDiscount.find(params[:id])
    if @category_reseller_discount.update_attributes(params[:category_reseller_discount])
      redirect_to [:admin, @category_reseller_discount], :notice  => "Successfully updated category reseller discount."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category_reseller_discount = CategoryResellerDiscount.find(params[:id])
    @category_reseller_discount.destroy
    redirect_to admin_category_reseller_discounts_url, :notice => "Successfully destroyed category reseller discount."
  end
  
  protected  
  def load_categories_resellers  
    @categories = Category.all(:order => "cod_sistema ASC").collect { |c| [c.cod_sistema + " - " + c.nome, c.id] }  
    @resellers = Reseller.all(:order => "cod_representante ASC").collect { |c| [c.cod_representante.to_s + " - " + c.nome, c.id] }
  end
end
