class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :description
      t.integer :needed, :default => 0
      t.integer :collected, :default => 0
      t.integer :commited, :default => 0
      t.integer :drive_id
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
