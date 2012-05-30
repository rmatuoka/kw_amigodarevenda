class CreateSirevs < ActiveRecord::Migration
  def self.up
    create_table :sirevs, :id => false do |t|
      t.string :cod_revenda, :primary => true
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
  end

  def self.down
    drop_table :sirevs
  end
end
