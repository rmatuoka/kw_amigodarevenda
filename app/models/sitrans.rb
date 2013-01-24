class Sitrans < ActiveRecord::Base
  attr_accessible :cod_trans, :transportadora, :fantasia, :cod_pais, :cod_estado, :cod_cidade, :cod_zona, :cod_bairro, :endereco, :nr, :cep, :telefone, :email1    
  set_primary_key :cod_trans
  has_many :sirevs, :foreign_key => 'cod_trans' 
end
