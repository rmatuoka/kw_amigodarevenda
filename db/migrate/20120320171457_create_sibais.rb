class CreateSibais < ActiveRecord::Migration
  def self.up
    create_table :sibais, :id => false do |t|
      t.string :cod_pais
      t.string :cod_estado
      t.string :cod_cidade
      t.string :cod_zona
      t.string :cod_bairro
      t.string :bairro

      t.timestamps
    end
  end

  def self.down
    drop_table :sibais
  end
end
