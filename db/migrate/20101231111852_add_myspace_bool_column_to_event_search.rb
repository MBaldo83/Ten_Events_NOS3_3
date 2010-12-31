class AddMyspaceBoolColumnToEventSearch < ActiveRecord::Migration
  def self.up
  
	add_column :event_searches, :myspaceSearch, :boolean
  
  end

  def self.down
  
	remove_column :event_searches, :myspaceSearch
  
  end
end
