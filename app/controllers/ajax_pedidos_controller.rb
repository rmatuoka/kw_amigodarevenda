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
        produto.valor = params[:preco]
        produto.save
    else
      puts "VAZIO"
      @alerts = "<script>alert('Produto inválido! Confira o código do produto/categoria.');</script>"
    end
    
    carrega_carrinho
    
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
    @out = ""
    @pedido_items = @pedido.product_request_items.all
    @pedido_items.each do |p|
      @item = Product.find(p.product_id)
      if @item
        @out += "<div id='Nomeproduto'><h3 style='margin:8px 0 0 10px;'>"+ @item.nome
      	@out += "</h3></div><div id='Unidade>'></div>"
      end
    end
  end
end
