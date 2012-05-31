class AddCodTransportadoraToTransporter < ActiveRecord::Migration
  def self.up
    add_column :transporters, :cod_transportadora, :string
  end

  def self.down
    remove_column :transporters, :cod_transportadora
  end
end
