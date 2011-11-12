class CreateResellers < ActiveRecord::Migration
  def self.up
    create_table :resellers do |t|
      t.integer :cod_representante
      t.string :nome
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.string :fax
      t.timestamps
    end
  end

  def self.down
    drop_table :resellers
  end
end
