class Sirev < ActiveRecord::Base
  attr_accessible :cod_revenda, :revenda, :cod_revenda, :revenda, :fantasia, :cod_pais, :cod_estado, :cod_cidade, :cod_zona, :cod_bairro, :endereco, :nr, :cep, :telefone, :email1, :email2, :cod_repre, :cod_trans, :flag_ati    
  set_primary_key :cod_revenda
  belongs_to :sirepre, :foreign_key => 'cod_repre'  
end
