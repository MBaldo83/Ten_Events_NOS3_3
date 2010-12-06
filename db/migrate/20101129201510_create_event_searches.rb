class CreateEventSearches < ActiveRecord::Migration
  def self.up
    create_table :event_searches do |t|
	
	t.string :urlOne
	t.string :bandName
	t.string :eventDateCSS
	t.string :eventNameCSS
	t.string :eventTimeCSS
	t.string :eventLocationCSS
	t.string :priceCSS
	t.string :descriptionCSS

      t.timestamps
    end
  end

  def self.down
    drop_table :event_searches
  end
end
