class SuggestedEvent < ActiveRecord::Base

require 'paperclip'
#require 'aws-s3'

  has_attached_file :photo,
    :styles => {
      :thumb=> "50x50#",
      :small  => "150x150>" },
	:storage => :s3,
    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'teneventsnewbucket'


def update_attributes_extra(attributes)
	
	#logic for determining Venue Name and assiging attributes
	venueName = attributes[:venue]
	sameVenueName = Venue.where(:venueName => venueName)[0]
	
	if sameVenueName
	attributes[:city_location] = sameVenueName.city_location
	attributes[:latitude] = sameVenueName.latitude
	attributes[:longitude] = sameVenueName.longitude
	end
	
	#logic for determining Genre, preference to :new_taste if != empty string.
	newTaste = attributes[:new_taste]
	
	if (!newTaste.empty?)
	new_Taste_Entry = Taste.new
	new_Taste_Entry.genre = newTaste
	new_Taste_Entry.save
	attributes[:taste] = newTaste
	attributes[:new_taste] = ""
	end
	
	
	# if TT event / All event selected, save as an AllEvent type, and delete suggested Event
	if attributes[:all_TT_event].to_i == 1 or attributes[:ten_event].to_i == 1
	
	published_event = AllEvent.new
	published_event.attributes = attributes
	published_event.save
	self.delete
	return true
	end
	
	self.attributes = attributes
	self.save
end


end
