class CreateUpdates < ActiveRecord::Migration
  def self.up
    create_table :updates do |t|
      t.string :name
      t.text :body
      t.boolean :published
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :total_lidos
      t.timestamps
    end
  end

  def self.down
    drop_table :updates
  end
end
