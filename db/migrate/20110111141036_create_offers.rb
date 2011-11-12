class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string :name
      t.text :body
      t.datetime :date_inicio
      t.date_time :data_fim
      t.integer :published
      t.integer :total_clicks
      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
