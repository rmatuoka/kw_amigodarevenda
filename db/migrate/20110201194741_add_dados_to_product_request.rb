class AddDadosToProductRequest < ActiveRecord::Migration
  def self.up
    add_column :product_requests, :tipo_frete, :string
    add_column :product_requests, :informacoes_adicionais, :text
    add_column :product_requests, :fatura_para_cliente, :text
    add_column :product_requests, :endereco, :string
    add_column :product_requests, :bairro, :string
    add_column :product_requests, :cidade, :string
    add_column :product_requests, :uf, :string
    add_column :product_requests, :entrega_rua_numero, :string
    add_column :product_requests, :entrega_bairro, :string
    add_column :product_requests, :entrega_cidade, :string
    add_column :product_requests, :entrega_uf, :string
  end

  def self.down
    remove_column :product_requests, :entrega_uf
    remove_column :product_requests, :entrega_cidade
    remove_column :product_requests, :entrega_bairro
    remove_column :product_requests, :entrega_rua_numero
    remove_column :product_requests, :uf
    remove_column :product_requests, :cidade
    remove_column :product_requests, :bairro
    remove_column :product_requests, :endereco
    remove_column :product_requests, :fatura_para_cliente
    remove_column :product_requests, :informacoes_adicionais
    remove_column :product_requests, :tipo_frete
  end
end
