class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :tweet_id
      t.string :screen_name
      t.string :location
      t.string :url
      t.integer :followers_count
      t.integer :friends_count
      t.string :time_zone
      t.boolean :rails
      t.boolean :customer

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
