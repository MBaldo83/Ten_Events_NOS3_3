class CreateSuggestedEvents < ActiveRecord::Migration
  def self.up
    create_table :suggested_events do |t|

	  t.string :eventName
      t.string :bandName
      t.string :venue
      t.string :longitude
      t.string :latitude
      t.time   :doorsOpen
      t.string :price
      t.date   :eventDate
      t.text   :description
      t.text   :specialOffers
	  
	  #location and event type
	  t.string  :city_location
	  
	  #paperclip
	  t.string :photo_file_name
	  t.string :photo_content_type
	  t.integer :photo_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :suggested_events
  end
end
