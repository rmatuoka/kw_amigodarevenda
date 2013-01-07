class AddComplementosToSirev < ActiveRecord::Migration
  def self.up
    add_column :sirevs, :cod_repre, :string
    add_column :sirevs, :cod_trans, :string
    add_column :sirevs, :flag_ati, :string
  end

  def self.down
    remove_column :sirevs, :flag_ati
    remove_column :sirevs, :cod_trans
    remove_column :sirevs, :cod_repre
  end
end
