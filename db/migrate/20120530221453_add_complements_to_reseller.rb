class AddComplementsToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :cod_representante, :string
    add_column :resellers, :zona, :string
    add_column :resellers, :pais, :string
    add_column :resellers, :numero, :string
  end

  def self.down
    remove_column :resellers, :numero
    remove_column :resellers, :pais
    remove_column :resellers, :zona
    remove_column :resellers, :cod_representante
  end
end
