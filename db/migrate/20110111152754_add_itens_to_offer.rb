class AddItensToOffer < ActiveRecord::Migration
  def self.up
    add_column :offers, :data_fim, :datetime
  end

  def self.down
    remove_column :offers, :data_fim
  end
end
