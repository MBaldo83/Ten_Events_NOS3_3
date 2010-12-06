class Venue < ActiveRecord::Base


def update_attributes_extra(attributes)

	oldVenueName = attributes[:old_venue_name]
	allEventsAtVenueName = AllEvent.where(:venue => oldVenueName)
	suggestedEventsAtVenueName = SuggestedEvent.where(:venue => oldVenueName)
	
	if allEventsAtVenueName[0]
		allEventsAtVenueName.each do |a|
		a.venue = attributes[:venueName]
		a.city_location = attributes[:city_location]
		a.longitude = attributes[:longitude]
		a.latitude = attributes[:latitude]
		a.save
		end
	
	end
	
	if suggestedEventsAtVenueName[0]
		suggestedEventsAtVenueName.each do |a|
		a.venue = attributes[:venueName]
		a.city_location = attributes[:city_location]
		a.longitude = attributes[:longitude]
		a.latitude = attributes[:latitude]
		a.save
		end
	end


	attributes[:old_venue_name] = attributes[:venueName]
	self.attributes = attributes
	self.save
end


end
