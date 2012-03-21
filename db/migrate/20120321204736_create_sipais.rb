class CreateSipais < ActiveRecord::Migration
  def self.up
    create_table :sipais, :id => false do |t|
      t.string :cod_pais
      t.string :pais

      t.timestamps
    end
  end

  def self.down
    drop_table :sipais
  end
end
