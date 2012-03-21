class CreateSizonas < ActiveRecord::Migration
  def self.up
    create_table :sizonas, :id => false do |t|
      t.string :cod_pais
      t.string :cod_estado
      t.string :cod_cidade
      t.string :cod_zona
      t.string :zona

      t.timestamps
    end
  end

  def self.down
    drop_table :sizonas
  end
end
