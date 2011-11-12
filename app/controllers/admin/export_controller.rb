class Admin::ExportController < ApplicationController
  layout "admin"
  require 'fileutils'
  
  def index
    #INICIO DA ROTINA DE EXPORTAÇÃO
    #VERIFICA SE O ARQUIVO EXISTE, SE NAO, CRIA
    path_arquivo_pedido = "public/export/new/PED.TXT"
    
    if File.exists?(path_arquivo_pedido)
      File.delete(path_arquivo_pedido)
    end
    
    arquivo_pedido = File.open(path_arquivo_pedido,'w')
    #RESGATA INFORMAÇÕES
    users = User.all
    linha = ""
    
    users.each do |user|
      representante = Representant.first(:conditions => ['user_id = ?', user.id])
      
      if representante
        user.product_requests.all(:conditions => ['status = ?', 'ENCAMINHADO']).each do |pedido|
          reseller = Reseller.find(pedido.reseller_id)
          if reseller
            #PEGA O VALOR TOTAL
            total = pedido.product_request_items.all.sum(:valor)
            
            #DADOS DO PEDIDO
            linha += pedido.id.to_s
            linha += "; "
            linha += representante.cod_sistema
            linha += "; "
            linha += reseller.cod_sistema
            linha += "; "
            linha += "SIF"
            linha += "; "
            linha += pedido.tipo_frete.to_s
            linha += "; "
            linha += "total.to_s"
            linha += "; "
            
            #INICIO LOOP ITENS
            pedido.product_request_items.all.each do |item|
              #SELECT PRODUTO
              produto = Product.find(item.product_id)
              categoria = Category.find(produto.category_id)
              
              linha += "COD ITEM NARCY"
              linha += "; "
              linha += categoria.cod_sistema
              linha += "; "
              linha += produto.cod_sistema
              linha += "; "
              linha += item.quantidade.to_s
              linha += "; "
              linha += "DESCONTO1"
              linha += "; "
              linha += "DESCONTO2"
              linha += "; "
              linha += "DESCONTO3"
              linha += "; "
              linha += "DESCONTO R$"
              linha += "; "
              linha += "ACRESCIMO R$"
              linha += "; "
              linha += item.valor.to_s
              linha += "; "
            end
            
            linha += "INFORMAÇÕES ADICIONAIS"
            linha += "\n"
          end
        end
        #ESCREVE NO ARQUIVO
        arquivo_pedido.puts linha
      end
      
    end
    
    
    #ESCREVE NO ARQUIVO  
    #---------------------------- TEMPLATE
    #ID PEDIDO WEB (10 POSICOES)
    #COD REPRESENTANTE (14)
    #COD REVENDA (14)
    #SIF/FOB (C/F)
    #FRETE (S/N)
    #VL TOTAL (13,2)
    #----ITEM
    #COD ITEM NARCY (3)
    #GRUPO PRODUTO (3)
    #PRODUTO(6)
    #QUANTIDADE(9,2) (transformar para decimal)
    #DESCONTO1% (13,2)
    #DESCONTO2% (13,2)
    #DESCONTO3% (13,2)
    #DESCONTOR$ (13,2)
    #ACRESCIMOR$ (13,2)
    #VL.UN R$ (13,2)
    #INFORMACOES ADICIONAIS (X)
    
    #FECHA O ARQUIVO
    arquivo_pedido.close unless arquivo_pedido.closed?
  end
end
