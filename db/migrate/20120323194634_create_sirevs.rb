class CreateSirevs < ActiveRecord::Migration
  def self.up
    create_table :sirevs, :id => false, :force => true do |t|
      t.string :cod_revenda
      t.string :revenda
      t.string :fantasia
      t.string :cod_pais
      t.string :cod_estado
      t.string :cod_cidade
      t.string :cod_zona
      t.string :cod_bairro
      t.string :endereco
      t.string :nr
      t.string :cep
      t.string :telefone
      t.string :email1
      t.string :email2
      t.timestamps
    end
    add_index :sirevs, :cod_revenda, :unique => true
  end

  def self.down
    drop_table :sirevs
  end
end
