class Representante::PedidosController < ApplicationController
  require "rails3-jquery-autocomplete"
  autocomplete :category, :cod_sistema, {:limit => 200}
  autocomplete :product, :cod_sistema, {:limit => 200}
  
  #before_filter :carrega_info
  access_control do
    allow :representante, :all
  end

  def index
    @representante = current_user.representants.first
  end
  
  def new
    #GRAVA INFORMAÇÕES ADICIONAIS 
    if request.post?
      #GRAVA
      @pedido = ProductRequest.find(session[:pedido_id])
      @pedido.tipo_frete  = params[:tipo_frete]
      @pedido.informacoes_adicionais = params[:informacoes_adicionais]
      @pedido.fatura_para_cliente  = params[:fatura_para_cliente]
      @pedido.endereco  = params[:endereco]
      @pedido.bairro  = params[:bairro]
      @pedido.cidade  = params[:cidade]
      @pedido.uf  = params[:uf]
      @pedido.entrega_rua_numero  = params[:entrega_rua_numero]
      @pedido.entrega_bairro  = params[:entrega_bairro]
      @pedido.entrega_cidade  = params[:entrega_cidade]
      @pedido.entrega_uf  = params[:entrega_uf]
      
      if !@pedido.save
        #ERRO
      else
        #CARREGA OS ITENS RESTANTES
        @out =""
        @valor_total = 0
        @reseller = Reseller.find(@pedido.reseller_id)
        @transporter = Transporter.find(@pedido.transporter_id)
        @produtos = @pedido.product_request_items.all
        
        @produtos.each do |p|  
      	  @out += "<tr>"
          @out +=       "<td height='31'>#{p.quantidade}</td>"
          @out +=       "<td>ADAPTADOR BOMBA NBF/HM ABS</td>"
          @out +=       "<td>R$ #{p.valor}</td>"
          @out +=     "</tr>"
        	
        	@valor_total += p.valor
      	end
      end
    end
  end
  
  def create
    #Cria um novo PEDIDO
    @pedido = ProductRequest.new
    @pedido.user_id = current_user.id
    @pedido.status = "INCOMPLETO"
    @pedido.transporter_id = params[:transportadora][:transporter_id]
    @pedido.reseller_id = params[:revenda][:reseller_id]
    
    if !@pedido.save
      #ERRO
    else
      #REDIRECIONAR PARA PASSO2
      redirect_to passo2_cod_representante_pedido_path(@pedido)
    end
  end
  
  def passo2
    #CARREGA AS Categorias
    @categorias = Category.all
    @pedido = ProductRequest.find(params[:id])
  end
  
  def passo2_cod
    #CARREGA AS Categorias
    @categorias = Category.all
    @pedido = ProductRequest.find(params[:id])
    
  end
  
  def passo3
    @pedido = ProductRequest.find(params[:id])
    session[:pedido_id] = @pedido.id
    
    #carrega formas de pagamento
    @payments = Payment.all
  end
  
  def passo4
    @pedido = ProductRequest.find(params[:id])
    @pedido.tipo_frete = params[:tipo_frete]
    @pedido.informacoes_adicionais = params[:informacoes_adicionais]
    @pedido.fatura_para_cliente = params[:fatura_para_cliente]
    @pedido.endereco = params[:endereco]
    @pedido.bairro = params[:bairro]
    @pedido.cidade = params[:cidade]
    @pedido.uf = params[:uf]
    @pedido.entrega_rua_numero = params[:entrega_rua_numero]
    @pedido.entrega_bairro = params[:entrega_bairro]
    @pedido.entrega_cidade = params[:entrega_cidade]
    @pedido.entrega_uf = params[:entrega_uf]
    @pedido.status = "ENCAMINHADO"
    @pedido.payment_id = params[:payment]
    
    #SETA FORMAS DE PAGAMENTO
    
    if !@pedido.save
      #erro
    else
      #EXIBIR TELA DE SUCESSO
      #DISPARAR EMAIL PARA NAUTILUS E REPRESENTANTE
      redirect_to root_path
    end
  end
  
  #def autocomplete_category_cod_sistema
  #end
  
  def finalizar
    @pedido = ProductRequest.find(params[:id])
    #ATUALIZA STATUS PEDIDO
    @pedido.status = "ENCAMINHADO"

    if !@pedido.save
      #erro
      @out = "Erro ao gravar o pedido. Entre em contato com o suporte."
    else
      @out = ""
    end
  end

end
