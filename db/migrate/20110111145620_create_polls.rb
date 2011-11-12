class CreatePolls < ActiveRecord::Migration
  def self.up
    create_table :polls do |t|
      t.string :name
      t.boolean :multiple
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :published
      t.timestamps
    end
  end

  def self.down
    drop_table :polls
  end
end
