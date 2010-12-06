class SuggestedEventsColToMatchAllEvents < ActiveRecord::Migration
  def self.up
  
  add_column :suggested_events, :all_TT_event, :boolean
  add_column :suggested_events, :ten_event, :boolean
  
  end

  def self.down
  
  remove_column :suggested_events, :all_TT_event
  remove_column :suggested_events, :ten_event
  
  end
end
