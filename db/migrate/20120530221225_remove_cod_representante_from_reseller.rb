class RemoveCodRepresentanteFromReseller < ActiveRecord::Migration
  def self.up
    remove_column :resellers, :cod_representante
  end

  def self.down
    add_column :resellers, :cod_representante, :integer
  end
end
