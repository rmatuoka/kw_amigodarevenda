class CreateSitrans < ActiveRecord::Migration
  def self.up
    create_table :sitrans, :id => false, :force => true do |t|
      t.string :cod_trans
      t.string :transportadora
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

      t.timestamps
    end
    add_index :sitrans, :cod_trans, :unique => true
  end

  def self.down
    drop_table :sitrans
  end
end
