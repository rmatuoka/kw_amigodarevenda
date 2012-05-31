class RemoveNumeroFromReseller < ActiveRecord::Migration
  def self.up
    remove_column :resellers, :numero
  end

  def self.down
    add_column :resellers, :numero, :integer
  end
end
