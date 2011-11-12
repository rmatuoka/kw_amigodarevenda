class Admin::ImportController < ApplicationController
  layout "admin"
  def index
    require 'fileutils'
    
    #PRODUTOS
    if File.exists?('public/import/new/PROD.TXT')
      @temp = Temporary.all
      @temp.each do |t|
        t.destroy
      end
      
      arquivo_prod = File.open('public/import/new/PROD.TXT','r')
      @produtos = arquivo_prod.readlines
      arquivo_prod.close
      
      #GRAVA NA TABELA TEMPORARIA
      counter = 0
      @produtos.count.times do
        @temp = Temporary.new
        itens = @produtos[counter].split(';')
        @temp.cod_cat = itens[0]
        @temp.categoria = itens[1]
        @temp.cod_produto = itens[2]
        @temp.produto = itens[3]
        @temp.save
        counter = counter + 1
      end
      
      #GRAVA AS CATEGORIAS
      #CASO A CATEGORIA JÁ EXISTA, DA O UPDATE, CASO CONTRARIO ADICIONA
      @categorias_temp = Temporary.all(:group => "categoria")
      if @categorias_temp
        @categorias_temp.each do |c|
          categoria = Category.first(:conditions => ['cod_sistema = ?', c.cod_cat])
          if !categoria
            categoria = Category.new
          end
          categoria.cod_sistema = c.cod_cat
          categoria.nome = c.categoria
          categoria.save
        end
      end
      
      #GRAVA OS PRODUTOS
      #CASO O PRODUTO JÁ EXISTA, DA O UPDATE, CASO CONTRARIO ADICIONA
      @produtos_temp = Temporary.all()
      if @produtos_temp
        @produtos_temp.each do |p|
          produto = Product.first(:conditions => ['cod_sistema = ? AND cod_categoria_sistema = ?', p.cod_produto, p.cod_cat])
          if !produto
            produto = Product.new
          end
          produto.cod_sistema = p.cod_produto
          produto.nome = p.produto
          produto.cod_categoria_sistema = p.cod_cat
          
          #Resgata a categoria
          categoria = Category.first(:conditions => ['cod_sistema = ?', p.cod_cat])
          produto.category_id = categoria.id
          if !produto.save
            flash[:notice] = "Erro ao salvar alguns registros"
          end
        end
      end
      
      #RENOMEIA E MOVE O ARQUIVO
      novo_nome_arquivo = Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/PROD.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      
    end
  end
end
