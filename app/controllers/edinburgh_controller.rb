class EdinburghController < ApplicationController

before_filter :authenticate, :except => [:index]

require 'nokogiri'
require 'open-uri'


 def index
	
	@title = "Edinburgh"
	
	#start afresh each time, for test purposes
	#delete_all_events
	
	#to allow deleting events
	@all_events = AllEvent.all
	@all_venues = Venue.all
	
	#final implementation
	@ed_ten_events = AllEvent.where(:city_location => 'Edinburgh', :ten_event => true)
	@ed_all_events = AllEvent.where(:city_location => 'Edinburgh', :all_TT_event => true)
	@ed_venues = Venue.where(:city_location => 'Edinburgh')
	
	#find_all_events #function in AppController
	
	@savedEventSearches = EventSearch.all
		
	@suggested_events = SuggestedEvent.all
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ed_ten_events }
      format.json { render :json => @ed_ten_events }
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
 
 
end
