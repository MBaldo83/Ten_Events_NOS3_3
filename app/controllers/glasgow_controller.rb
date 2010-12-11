class GlasgowController < ApplicationController

before_filter :authenticate, :except => [:index]

require 'nokogiri'
require 'open-uri'
require 'paperclip'

  def index

    @title = "Glasgow"
	
		#final implementation
	@glasg_ten_events = AllEvent.where(:city_location => 'Glasgow', :ten_event => true)
	@glasg_all_events = AllEvent.where(:city_location => 'Glasgow', :all_TT_event => true)
	@glasg_venues = Venue.where(:city_location => 'Glasgow')
	@all_glasgow_events = AllEvent.where(:city_location => 'Glasgow')
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @all_glasgow_events }
      format.json { render :json => @all_glasgow_events }
    end	
	
  
  end
  
  
  def destroy
  
  @title = "destroy glasgow!"
  
  end

end
