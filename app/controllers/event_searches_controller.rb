class EventSearchesController < ApplicationController

def index

@title = "Event search index"
@event_searches = EventSearch.order('"bandName" ASC')
#@event_searches = EventSearch.all

end


  def show
  
  #the instance of the object that holds the details of the url / band name etc...
  @event_search = EventSearch.find(params[:id])
  @title = @event_search.bandName
  
  logger.debug"In Event Search Show"
  #the instance of the object that gets put on the queue
  @event_searcher = EventSearcher.new
  @event_searcher.one_event_id = @event_search.id
  @event_searcher.all_events = 0
  logger.debug(@event_search.id)
  Delayed::Job.enqueue @event_searcher
  
  #find_one_band_events(@title)
  flash[:notice] = "finding events... refresh page in a few seconds"
  redirect_to suggested_events_path
  end
  

  def edit
  @event_search = EventSearch.find(params[:id])
  @title = "Edit Event Search"
  
  end
  
  def new
  
  @title = "New Event Search"
  @event_search = EventSearch.new
  
  end
  
  def create
  
  @event_search = EventSearch.new(params[:event_search])
  
		if @event_search.myspaceSearch
		
		@event_search.eventDateCSS = ".entryDate"
		@event_search.eventLocationCSS = "#module9 a"
		@event_search.descriptionCSS = "#module9 p"
		
		end #of if
  
      if @event_search.save
	
	  flash[:success] = "new event search created"
      redirect_to '/event_searches'
    else
      @title = "New Event Search"
      render 'new'
    end
  end
  
  def update
  
  @event_search = EventSearch.find(params[:id])
  
	if @event_search.update_attributes_extra(params[:event_search])
      flash[:success] = "Event Search updated."
      redirect_to '/event_searches'
    else
      @title = "Edit event"
      render 'edit'
    end
	
  end
  
  def destroy
	EventSearch.find(params[:id]).destroy
    flash[:success] = "Event search destroyed."
    redirect_to '/event_searches'
  end
  
  

end
