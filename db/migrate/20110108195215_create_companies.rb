class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :screen_name
      t.integer :next_cursor

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
