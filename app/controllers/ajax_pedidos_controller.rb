class AjaxPedidosController < ApplicationController
  before_filter :carrega_pedido
  layout "blank"
  
  def index
    carrega_carrinho
  end
  
  def show
    carrega_carrinho
  end
  
  def gravar
    #GRAVA PRODUTOS
    if !params[:produto].blank? && !params[:quantidade].blank? && !params[:categoria].blank?
      
      produto_id = Product.first(:conditions => ['cod_sistema = ? AND cod_categoria_sistema = ?', params[:produto], params[:categoria]])
      
      if produto_id
        #VERIFICA SE O PRODUTO JÁ FOI INSERIDO
        produto = @pedido.product_request_items.first(:conditions => ['product_id = ?', produto_id.id])
      
        if !produto
          produto = @pedido.product_request_items.build
          quantidade = params[:quantidade]
        else
          quantidade = produto.quantidade + params[:quantidade].to_i
        end
        produto.product_id = produto_id.id
        produto.quantidade = quantidade
        produto.valor = params[:preco].gsub(",",".").to_f
        
        #salva descontos
        produto.discount = params[:discount] if params[:discount] != "undefined"
        produto.discount2 = params[:discount2] if params[:discount2] != "undefined"
        produto.discount3 = params[:discount3] if params[:discount3] != "undefined"
        produto.discount4 = params[:discount4] if params[:discount4] != "undefined"
        produto.discount5 = params[:discount5] if params[:discount5] != "undefined"
        produto.discount6 = params[:discount6] if params[:discount6] != "undefined"
        produto.discount7 = params[:discount7] if params[:discount7] != "undefined"
        
        produto.save
    else
      puts "VAZIO"
      @alerts = "<script>alert('Produto inválido! Confira o código do produto/categoria.');</script>"
    end
    
    carrega_carrinho
    
    end
  end
  
  def discount
    if !params[:grupo].blank? && !params[:reseller].blank?
      @category = Category.first(:conditions => ['cod_sistema = ?', params[:grupo]])
      @reseller = Reseller.find(params[:reseller])
      @discounts = @reseller.category_reseller_discounts.first(:conditions => ['category_id = ?', @category.id])
      
      @out = ""
      
      if !@discounts.blank?
        @out += "<select name='desconto1' id='desconto1' class='cb_discount'><option>0</option><option>#{@discounts.discount}</option></select> " if @discounts.discount > 0
        @out += "<select name='desconto2' id='desconto2' class='cb_discount'><option>0</option><option>#{@discounts.discount2}</option></select> " if @discounts.discount2 > 0
        @out += "<select name='desconto3' id='desconto3' class='cb_discount'><option>0</option><option>#{@discounts.discount3}</option></select> " if @discounts.discount3 > 0
        @out += "<select name='desconto4' id='desconto4' class='cb_discount'><option>0</option><option>#{@discounts.discount4}</option></select> " if @discounts.discount4 > 0
        @out += "<select name='desconto5' id='desconto5' class='cb_discount'><option>0</option><option>#{@discounts.discount5}</option></select> " if @discounts.discount5 > 0
        @out += "<select name='desconto6' id='desconto6' class='cb_discount'><option>0</option><option>#{@discounts.discount6}</option></select> " if @discounts.discount6 > 0
        @out += "<select name='desconto7' id='desconto7' class='cb_discount'><option>0</option><option>#{@discounts.discount7}</option></select> " if @discounts.discount7 > 0
       
      else
        @out = "<p class=\"Box_noticias\" style=\"color:red;\">Não há descontos cadastrados neste grupo para esta revenda.</p>"
      end
    end
  end
  
  def limpar
    #DELETA ITENS
    @deletar_items = @pedido.product_request_items.all
    @deletar_items.each do |d|
      d.destroy
    end
    carrega_carrinho
  end
  
  def finalizar
    #@pedido.status = "ENCAMINHADO"
    #@pedido.save
    #session[:pedido] = nil
    #@out = "<br><br>Seu pedido foi finalizado e enviado para nossa equipe com sucesso.<br><br> Em breve entraremos em contato.<br><br>"
    #@out += "<i>Equipe Nautilus</i>"
  end
  
  def carrega_pedido
    if !params[:pedido].blank?
      @pedido = ProductRequest.find(params[:pedido])
    end
  end
  
  def carrega_carrinho
    #GERA HTML
    @total_final = 0
    @out = ""
    @pedido_items = @pedido.product_request_items.all
    @pedido_items.each do |p|
      @item = Product.find(p.product_id)
      if @item
        #CALCULA OS DESCONTOS
        $valorun = p.valor
				
				$valorun = $valorun - ($valorun * (p.discount / 100)) if p.discount > 0
				$valorun = $valorun - ($valorun * (p.discount2 / 100)) if p.discount2 > 0
				$valorun = $valorun - ($valorun * (p.discount3 / 100)) if p.discount3 > 0
				$valorun = $valorun - ($valorun * (p.discount4 / 100)) if p.discount4 > 0
				$valorun = $valorun - ($valorun * (p.discount5 / 100)) if p.discount5 > 0
				$valorun = $valorun - ($valorun * (p.discount6 / 100)) if p.discount6 > 0
				$valorun = $valorun - ($valorun * (p.discount7 / 100)) if p.discount7 > 0
				
				$valorun = $valorun * p.quantidade
				
        @out += "<div id='Nomeproduto'><h3 style='margin:8px 0 0 10px;'>"+ @item.nome
      	@out += "</h3></div><div id='Unidade'><h4>#{p.quantidade}<h4></div>"
      	@out += "<div id='Preco'>R$ #{$valorun}</div>"
      	
      	@total_final += $valorun
      end
    end
    @out += "<div id='Total'><h4>Total final:</h4> R$ #{@total_final}</div>"
  end
end
