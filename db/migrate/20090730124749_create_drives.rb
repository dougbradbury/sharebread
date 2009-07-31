class CreateDrives < ActiveRecord::Migration
  def self.up
    create_table :drives do |t|
      t.string :name
      t.datetime :sign_up_by
      t.datetime :collect_by
      t.text :info
      t.text :collection_instructions
      t.timestamps
    end
  end

  def self.down
    drop_table :drives
  end
end
