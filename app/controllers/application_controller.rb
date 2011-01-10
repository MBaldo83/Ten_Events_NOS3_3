class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  
  	def authenticate
	logger.debug"changing app controller"
      deny_access unless signed_in?
    end


#This is only for development re filling the artist's myspace urls automatically	
 def make_new_searches
	
	url = "/Users/MichaelB/Documents/TenTracks/artists.html"
	
	
	doc = Nokogiri::HTML(open(url))
	bands_array = doc.css("h1")
	i=259
	#Rails.logger.debug(i)
	
	while i < bands_array.length or i < 10
	
	Rails.logger.debug(i)
	Rails.logger.debug(bands_array[i].content)
	
	test = EventSearch.where(:bandName => bands_array[i].content)
	
	if !test[0]
	
	es = EventSearch.new
	es.bandName = bands_array[i].content
	
	band_search = bands_array[i].content.split(' ').join("+")
	
	url2 = "http://www.myspace.com/search/music?q=" << band_search << "&ac=t"
	#Rails.logger.debug(url2)
	
	if validate(url2)
	doc2 = Nokogiri::HTML(open(url2))
	band_url_array = doc2.css(".beacon .beacon")
	
		if band_url_array[0]
			Rails.logger.debug(band_url_array[0][:href])
			es.urlOne = band_url_array[0][:href]
			es.eventDateCSS = ".entryDate"
			es.eventLocationCSS = "#module9 a"
			es.descriptionCSS = "#module9 p"
		else
		Rails.logger.debug("Invalid myspace link")
		es.urlOne = "Invalid myspace link"
		end
	
	else
	Rails.logger.debug("Invalid myspace link")
	es.urlOne = "Invalid myspace link"
	
	end # of validate
	
	es.save
	
	end #of test
	
	i += 1
	end # of while
	
 end 
 
 
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
