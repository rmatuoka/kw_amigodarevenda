class AddUltimaTransportadoraToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :ultima_transportadora, :integer
  end

  def self.down
    remove_column :resellers, :ultima_transportadora
  end
end
