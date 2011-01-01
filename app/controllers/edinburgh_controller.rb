class EdinburghController < ApplicationController

before_filter :authenticate, :except => [:index]

require 'nokogiri'
require 'open-uri'
require 'paperclip'
#require 'aws-s3'

 def index
	
	@title = "Edinburgh"
	
	#start afresh each time, for test purposes
	#delete_all_events
	#delete_all_venues
	
	#to allow deleting events
	@all_events = AllEvent.all
	@all_venues = Venue.all
	
	#final implementation
	@ed_ten_events = AllEvent.where(:city_location => 'Edinburgh', :ten_event => true).order('"eventDate" ASC')
	@ed_all_events = AllEvent.where(:city_location => 'Edinburgh', :all_TT_event => true).order('"eventDate" ASC')
	@ed_venues = Venue.where(:city_location => 'Edinburgh')
	@all_edinburgh_events = AllEvent.where(:city_location => 'Edinburgh')
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @all_edinburgh_events }
      format.json { render :json => @all_edinburgh_events }
    end	
	
 end
   
   
 def delete_all_events
   
   @all_events = AllEvent.all
   @suggested_events = SuggestedEvent.all
   
   	@all_events.each do |e|
	e.delete
	end
	
	@suggested_events.each do |e|
	e.delete
	end
	
  end
  
 def delete_all_venues
   
   @all_venues = Venue.all
   
   	@all_venues.each do |e|
	e.delete
	end
	
  end
 
 
end
