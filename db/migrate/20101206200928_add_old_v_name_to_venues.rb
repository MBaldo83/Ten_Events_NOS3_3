class AddOldVNameToVenues < ActiveRecord::Migration
  def self.up
  
  add_column :venues, :old_venue_name, :string
  
  end

  def self.down
  
  remove_column :venues, :old_venue_name
  
  end
end
