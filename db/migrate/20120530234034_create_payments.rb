class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.string :descricao
      t.boolean :tipo
      t.decimal :valor, :precision => 10, :scale => 2, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
