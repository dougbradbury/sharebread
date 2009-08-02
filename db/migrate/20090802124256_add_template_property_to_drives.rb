class AddTemplatePropertyToDrives < ActiveRecord::Migration
  def self.up
    add_column :drives, :template, :boolean
  end

  def self.down
    remove_column :drives, :template
  end
end
