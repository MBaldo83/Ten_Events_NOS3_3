class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
	
	  t.string :venueName
	  t.string :city_location
	  t.string :longitude
	  t.string :latitude
	  
	  #paperclip
	  t.string :photo_file_name
	  t.string :photo_content_type
	  t.integer :photo_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
