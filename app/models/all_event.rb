class AllEvent < ActiveRecord::Base

CITIES = ['Edinburgh', 'Glasgow', 'London']

def update_attributes_extra(attributes)

	venueName = attributes[:venue]
	sameVenueName = Venue.where(:venueName => venueName)[0]
	
	if sameVenueName
	attributes[:city_location] = sameVenueName.city_location
	attributes[:latitude] = sameVenueName.latitude
	attributes[:longitude] = sameVenueName.longitude
	end
	
	self.attributes = attributes
	self.save
end



end
