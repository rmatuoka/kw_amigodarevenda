class RemoveUltimaTransportadoraFromReseller < ActiveRecord::Migration
  def self.up
    remove_column :resellers, :ultima_transportadora
  end

  def self.down
    add_column :resellers, :ultima_transportadora, :integer
  end
end
