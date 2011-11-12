class AddCodigoToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :cod_sistema, :string
  end

  def self.down
    remove_column :resellers, :cod_sistema
  end
end
