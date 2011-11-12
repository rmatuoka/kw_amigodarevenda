class AddItemToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :representant_id, :integer
  end

  def self.down
    remove_column :resellers, :representant_id
  end
end
