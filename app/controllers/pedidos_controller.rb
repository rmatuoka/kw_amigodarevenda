class PedidosController < ApplicationController
  before_filter :autentica, :carrega_pedido, :carrega_carrinho
  layout "blank"
  
  def index
    
  end
  
  def gravar
    #GRAVA PRODUTOS
    if !params[:produto].blank? && !params[:quantidade].blank?
      #VERIFICA SE O PRODUTO JÁ FOI INSERIDO
      produto = @pedido.product_request_items.first(:conditions => ['product_id = ?', params[:produto]])
      
      if !produto
        produto = @pedido.product_request_items.build
        quantidade = params[:quantidade]
      else
        quantidade = produto.quantidade + params[:quantidade].to_i
      end
      produto.product_id = params[:produto]
      produto.quantidade = quantidade
      produto.save
      
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
    @pedido.status = "ENCAMINHADO"
    @pedido.save
    session[:pedido] = nil
    @out = "<br><br>Seu pedido foi finalizado e enviado para nossa equipe com sucesso.<br><br> Em breve entraremos em contato.<br><br>"
    @out += "<i>Equipe Nautilus</i>"
  end
  
  def carrega_pedido
    if !session[:pedido]
      @pedido = ProductRequest.new
      @pedido.user_id = session[:id]
      @pedido.status = "INCOMPLETO"
      if !@pedido.save
        #SE NAO GRAVOU O PEDIDO
      else
        session[:pedido] = @pedido.id
      end
    else
      @pedido = ProductRequest.find(session[:pedido])
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
