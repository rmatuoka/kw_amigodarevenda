class CreateSicids < ActiveRecord::Migration
  def self.up
    create_table :sicids, :id => false do |t|
      t.string :cod_pais
      t.string :cod_estado
      t.string :cod_cidade
      t.string :cidade

      t.timestamps
    end
  end

  def self.down
    drop_table :sicids
  end
end
