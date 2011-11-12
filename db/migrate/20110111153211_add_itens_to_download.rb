class AddItensToDownload < ActiveRecord::Migration
  def self.up
    add_column :downloads, :published, :boolean
  end

  def self.down
    remove_column :downloads, :published
  end
end
