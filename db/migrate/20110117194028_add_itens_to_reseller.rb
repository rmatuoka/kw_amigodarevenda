class AddItensToReseller < ActiveRecord::Migration
  def self.up
    add_column :resellers, :nome_fantasia, :string
    add_column :resellers, :cnpj, :string
    add_column :resellers, :inscricao_estadual, :string
    add_column :resellers, :responsavel, :string
    add_column :resellers, :email, :string
    add_column :resellers, :celular, :string
  end

  def self.down
    remove_column :resellers, :celular
    remove_column :resellers, :email
    remove_column :resellers, :responsavel
    remove_column :resellers, :inscricao_estadual
    remove_column :resellers, :cnpj
    remove_column :resellers, :nome_fantasia
  end
end
