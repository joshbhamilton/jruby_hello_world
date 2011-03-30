class CreateRailsUrls < ActiveRecord::Migration
  def self.up
    create_table :rails_urls do |t|
      t.string :url
      t.boolean :customer
      t.boolean :lead

      t.timestamps
    end
  end

  def self.down
    drop_table :rails_urls
  end
end
