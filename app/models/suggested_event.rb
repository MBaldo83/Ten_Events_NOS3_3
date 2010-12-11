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
	self.delete
	return true
	end
	
	self.attributes = attributes
	self.save
end


end
