class SuggestedEventsController < ApplicationController

before_filter :authenticate

def index
	
	@title = "SuggestedEvents"
	
	@savedEventSearches = EventSearch.order('"bandName" ASC')
	@suggested_events = SuggestedEvent.all
	
	#making new events from list of artists
	#make_new_searches
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.json { render :json => @events }
    end	
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
  
  def search_all_events
    
	logger.debug"Sugg E search all events"
  #the instance of the object that gets put on the queue
  @event_searcher = EventSearcher.new
  @event_searcher.one_event_id = nil
  @event_searcher.all_events = 1
  Delayed::Job.enqueue @event_searcher
	
	flash[:notice] = "Finding All events, this takes a while, refresh after 10 mins"
	redirect_to suggested_events_path
  
  end
  
  def delete_all_sugg_events
  
  @all_doomed_events = SuggestedEvent.all
  
  @all_doomed_events.each do |d|
  d.destroy
  end
  
  redirect_to suggested_events_path
  
  
  end


end
