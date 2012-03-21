class CreateSiests < ActiveRecord::Migration
  def self.up
    create_table :siests, :id => false do |t|
      t.string :cod_pais
      t.string :cod_estado
      t.string :estado
      t.string :uf

      t.timestamps
    end
  end

  def self.down
    drop_table :siests
  end
end
