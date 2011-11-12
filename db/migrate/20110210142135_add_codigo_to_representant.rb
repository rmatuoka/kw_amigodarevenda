class AddCodigoToRepresentant < ActiveRecord::Migration
  def self.up
    add_column :representants, :cod_sistema, :string
  end

  def self.down
    remove_column :representants, :cod_sistema
  end
end
