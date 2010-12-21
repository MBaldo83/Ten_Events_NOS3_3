class AddTasteAndEnergyLevelColumns < ActiveRecord::Migration
  def self.up
  
  add_column :all_events, :taste, :string
  add_column :all_events, :energyLevel, :integer
  
  add_column :suggested_events, :taste, :string
  add_column :suggested_events, :energyLevel, :integer
   
   end

  def self.down
  
  remove_column :all_events, :taste
  remove_column :all_events, :energyLevel
  
  remove_column :suggested_events, :taste
  remove_column :suggested_events, :energyLevel
  
  end
end
