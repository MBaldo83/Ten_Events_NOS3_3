class LondonController < ApplicationController

before_filter :authenticate

  def index

    @title = "London"
	
		#final implementation
	@lond_ten_events = AllEvent.where(:city_location => 'London', :ten_event => true)
	@lond_all_events = AllEvent.where(:city_location => 'London', :all_TT_event => true)
	@lond_venues = Venue.where(:city_location => 'London')
	@all_london_events = AllEvent.where(:city_location => 'London')
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @all_london_events }
      format.json { render :json => @all_london_events }
    end	
  
  end
  
  
  def destroy
  
  @title = "destroy london!"
  
  end

end
