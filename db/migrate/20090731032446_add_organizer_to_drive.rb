class AddOrganizerToDrive < ActiveRecord::Migration
  def self.up
    add_column :drives, :organizer_id, :int
  end

  def self.down
    remove_column :drives, :organizer_id
  end
end
