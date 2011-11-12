class AddCategoriaToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :cod_categoria_sistema, :string
  end

  def self.down
    remove_column :products, :cod_categoria_sistema
  end
end
