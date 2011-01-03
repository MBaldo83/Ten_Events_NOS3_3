class ApplicationController < ActionController::Base
  
  require 'date'
  require 'nokogiri'
  require 'open-uri'
  require 'chronic'
  
  protect_from_forgery
  include SessionsHelper
  
  	def authenticate
      deny_access unless signed_in?
    end
	
	
  def find_all_events

	@event_searches = EventSearch.all

	@event_searches.each do |es|

	do_search(es)

	end
 end

def find_one_band_events(event_id)

	es = EventSearch.where(:id => event_id)[0]
	do_search(es)
end

def do_search(event_search)

	logger.debug"Changing AppController again"
	logger.debug"in do search"
	url = event_search.urlOne
	
if validate(url)

logger.debug"Passed Validate URL"

	doc = Nokogiri::HTML(open(url))
	
	#if url = myspace, can get friends number 
	
	#search the doc with the saved css search strings
	if !(event_search.eventDateCSS.empty?) 
		startDate = doc.css(event_search.eventDateCSS) else eventDate = 0 end
	if !(event_search.eventNameCSS.empty?) 
		eventName = doc.css(event_search.eventNameCSS) else eventName = 0 end
	if !(event_search.eventLocationCSS.empty?) 
		location = doc.css(event_search.eventLocationCSS) else location = 0 end
	if !(event_search.eventTimeCSS.empty?) 
		time = doc.css(event_search.eventTimeCSS) else time = 0 end
	if !(event_search.priceCSS.empty?)
		price = doc.css(event_search.priceCSS) else price = 0 end
	if !(event_search.descriptionCSS.empty?)
		description = doc.css(event_search.descriptionCSS) else description = 0 end
	i=0
	
 if eventDate != 0	
	while i < startDate.length # find all events on that page going through each case of start date
	
		SuggestedEvent.new do |@savedEvent|
		
			if eventDate != 0
				@savedEvent.eventDate = date_from_string(startDate[i].content) 
				logger.debug(startDate[i].content)
				end
			
			test = SuggestedEvent.where(:bandName => event_search.bandName, 
										:eventDate => @savedEvent.eventDate)
										
			if !test[0]
			
			@savedEvent.bandName = event_search.bandName
			if eventName != 0 
				@savedEvent.eventName = remove_whitespace(eventName[i].content) 
				end
			if time != 0 
				@savedEvent.doorsOpen = Chronic.parse(time[i].content) end
			if price != 0 
				@savedEvent.price = price[i].content end
			if description !=0 
				@savedEvent.description = remove_whitespace(description[i].content) end
			
			if location != 0  
				savedVenueName = paramMatcher('Venue','venueName', remove_whitespace(location[i].content))
				if savedVenueName
					@savedEvent.venue = savedVenueName[0]
					@savedEvent.city_location = savedVenueName[1]
					@savedEvent.longitude = savedVenueName[2]
					@savedEvent.latitude = savedVenueName[3]
				else
					@newVenue = Venue.new
					@newVenue.venueName = remove_whitespace(location[i].content)
					@newVenue.old_venue_name = @newVenue.venueName
					@newVenue.save
					@savedEvent.venue = remove_whitespace(location[i].content)
				end #of if
			else
					@savedEvent.venue = 'No saved venue found'
			end #of location !=
			@savedEvent.save	
			end # of if !test
		end # of .new do
	 i += 1
	end # of while
 
 end #of if eventDate !=0

end # of if url passes


end # of def


# get the date from whatever string gets thrown
def date_from_string(date)

#remove st rd nd and th

firstParse = Chronic.parse(date)
r1 = /[a-zA-Z]/

#daY Less than 12, assume chronic wrong, aslong as also no characters such as December, 
#where it would be right
if firstParse.day <= 12 and !r1.match(date) 
	
	#swap month with day
	firstParse = firstParse.change(:day => firstParse.month, :month => firstParse.day)

	end #of if

  return firstParse

 end #of def

 
 
# remove whitespace and other characters such as newline
 
 def remove_whitespace(dirty_name)
 
  return dirty_name.split(' ').join(" ") 
 
 end
	

#find names in strings from the net
def paramMatcher(modelString, param, cssScrapedString)

	case modelString
	when 'Venue'
	venues = Venue.all
	i=0
		venues.each do |v|
		
			if v.venueName.scan(cssScrapedString)[0] or cssScrapedString.scan(v.venueName)[0]
		
			return [v.venueName, v.city_location, v.longitude, v.latitude]
			end
		
		end # of .each
	end # of case

return nil
end # of def param Matcher

def validate(url)
  begin
    uri = URI.parse(url)
    if uri.class != URI::HTTP
	  return false
    end
    rescue URI::InvalidURIError
	  return false
    end
  return true
end
	

end # of class
