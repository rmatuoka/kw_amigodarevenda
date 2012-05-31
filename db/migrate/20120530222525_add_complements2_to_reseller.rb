class AddComplements2ToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :cep, :string
    add_column :resellers, :numero, :string
  end

  def self.down
    remove_column :resellers, :numero
    remove_column :resellers, :cep
  end
end
