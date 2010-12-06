class SuggestedEvent < ActiveRecord::Base


def update_attributes_extra(attributes)

	venueName = attributes[:venue]
	sameVenueName = Venue.where(:venueName => venueName)[0]
	
	if sameVenueName
	attributes[:city_location] = sameVenueName.city_location
	attributes[:latitude] = sameVenueName.latitude
	attributes[:longitude] = sameVenueName.longitude
	end
	
	if attributes[:all_TT_event].to_i == 1 or attributes[:ten_event].to_i == 1
	
	published_event = AllEvent.new
	published_event.attributes = attributes
	published_event.save
	end
	
	self.attributes = attributes
	self.save
end


end
