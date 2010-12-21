class AddColumnNewTasteToSuggAndAllEvents < ActiveRecord::Migration
  def self.up
  
  add_column :all_events, :new_taste, :string
  add_column :suggested_events, :new_taste, :string
  
  end

  def self.down
  
  remove_column :all_events, :new_taste
  remove_column :suggested_events, :new_taste
  
  end
end
