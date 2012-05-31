class Admin::ResellersController < ApplicationController
  layout "admin"
  before_filter :load_representants, :except => [:show, :index]  
  
  def index
    @resellers = Reseller.all
  end
  
  def show
    @reseller = Reseller.find(params[:id],
    :select=> "`resellers`.*,`sipais`.`pais` as `nomepais`, `siests`.`UF`as `nomeestado`,`sicids`.`cidade` as `nomecidade`,`sizonas`.`zona` as `nomezona`, `sibais`.`bairro` as `nomebairro`",
    :joins=> "INNER JOIN `sipais`
    ON `resellers`.`pais` = `sipais`.`cod_pais`

    INNER JOIN `siests`
    ON  `resellers`.`pais` = `siests`.`cod_pais` 
    AND `resellers`.`estado` = `siests`.`cod_estado`

    INNER JOIN `sicids`
    ON  `resellers`.`pais` = `sicids`.`cod_pais` 
    AND `resellers`.`estado` = `sicids`.`cod_estado`  
    AND `resellers`.`cidade` = `sicids`.`cod_cidade`

    INNER JOIN `sizonas`
    ON `resellers`.`pais` = `sizonas`.`cod_pais` 
    AND `resellers`.`estado` = `sizonas`.`cod_estado`  
    AND `resellers`.`cidade` = `sizonas`.`cod_cidade` 
    AND `resellers`.`zona` = `sizonas`.`cod_zona`

    INNER JOIN `sibais`
    ON `resellers`.`pais` = `sibais`.`cod_pais` 
    AND `resellers`.`estado` = `sibais`.`cod_estado`  
    AND `resellers`.`cidade` = `sibais`.`cod_cidade` 
    AND `resellers`.`zona` = `sibais`.`cod_zona`
    AND `resellers`.`bairro` = `sibais`.`cod_bairro`")
    
    @discounts = @reseller.category_reseller_discounts.all
  end
  
  def new
    @reseller = Reseller.new
  end
  
  def create
    @reseller = Reseller.new(params[:reseller])
    if @reseller.save
      flash[:notice] = "Successfully created reseller."
      redirect_to admin_resellers_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @reseller = Reseller.find(params[:id])
    
  end
  
  def update
    @reseller = Reseller.find(params[:id])
    if @reseller.update_attributes(params[:reseller])
      flash[:notice] = "Successfully updated reseller."
      redirect_to admin_resellers_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @reseller = Reseller.find(params[:id])
    @reseller.destroy
    flash[:notice] = "Successfully destroyed reseller."
    redirect_to admin_resellers_path
  end
  
  protected  
  def load_representants
    @representants = Representant.all.collect { |c| [c.nome, c.id] }  
  end
end
