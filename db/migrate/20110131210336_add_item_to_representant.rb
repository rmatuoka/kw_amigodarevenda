class AddItemToRepresentant < ActiveRecord::Migration
  def self.up
    add_column :representants, :user_id, :integer
  end

  def self.down
    remove_column :representants, :user_id
  end
end
