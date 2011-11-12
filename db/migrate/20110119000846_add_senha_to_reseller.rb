class AddSenhaToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :senha, :string
  end

  def self.down
    remove_column :resellers, :senha
  end
end
