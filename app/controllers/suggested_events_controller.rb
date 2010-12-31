class SuggestedEventsController < ApplicationController

def index
	
	@title = "SuggestedEvents"
	
	@savedEventSearches = EventSearch.all
	@suggested_events = SuggestedEvent.all
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.json { render :json => @events }
    end	
  end
  
  def search_all_events
  
	find_all_events #method in Application controller
	redirect_to suggested_events_path
  
  end

  def show
  @event = SuggestedEvent.find(params[:id])
  
	respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
      format.json  { render :json => @event }
    end
  end

  def edit
     @event = SuggestedEvent.find(params[:id])
	 @venues = Venue.all
	 @tastes = Taste.all
	 
	 @selected_city = @event.city_location
	 @selected_venue = @event.venue
	 @selected_taste = @event.taste
     @title = "Edit SuggestedEvent"
  end
  

 def new
	@event = SuggestedEvent.new
	@venues = Venue.all
	
	@title = "New Event"
	
	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
      format.json  { render :json => @event } 
	end
 end
 
  def create
	
    @event = SuggestedEvent.new(params[:suggested_event])
	@venue = (Venue.where(:venueName => @event.venue))[0]
	
	if @venue
	@event.city_location = @venue.city_location
	@event.longitude = @venue.longitude
	@event.latitude = @venue.latitude
	end #of if
	
    if @event.save
	
	  flash[:success] = "new event created"
      redirect_to @event
    else
      @title = "New Event"
      render 'new'
    end
  end
  
  def update
    @event = SuggestedEvent.find(params[:id])
	
    if @event.update_attributes_extra(params[:suggested_event])
	
      flash[:success] = "SuggestedEvent updated."
      redirect_to @event
    else
      @title = "Edit event"
      render 'edit'
    end
	
  end
  
  def destroy
	SuggestedEvent.find(params[:id]).destroy
    flash[:success] = "SuggestedEvent destroyed."
    redirect_to suggested_events_path
  end


end
