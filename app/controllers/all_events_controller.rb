class AllEventsController < ApplicationController

 def index
	
	@title = "AllEvents"
	@events = AllEvent.all
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.json { render :json => @events }
    end	
  end

  def show
  @event = AllEvent.find(params[:id])
  
	respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
      format.json  { render :json => @event }
    end
  end

  def edit
     @event = AllEvent.find(params[:id])
	 @tastes = Taste.all
	 @venues = Venue.all
	 
	 @selected_venue = @event.venue
	 @selected_taste = @event.taste
     @title = "Edit AllEvent"
  end
  

 def new
	@event = AllEvent.new
	@venues = Venue.all
	
	@title = "New Event"
	
	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
      format.json  { render :json => @event } 
	end
 end
 
  def create
	
    @event = AllEvent.new(params[:all_event])
	@venue = (Venue.where(:venueName => @event.venue))[0]
	
	@event.city_location = @venue.city_location
	@event.longitude = @venue.longitude
	@event.latitude = @venue.latitude
	
    if @event.save
	
	  flash[:success] = "new event created"
      redirect_to @event
    else
      @title = "New Event"
      render 'new'
    end
  end
  
  def update
    @event = AllEvent.find(params[:id])
	
    if @event.update_attributes_extra(params[:all_event])
      flash[:success] = "AllEvent updated."
      redirect_to @event
    else
      @title = "Edit event"
      render 'edit'
    end
	
  end
  
  def destroy
	AllEvent.find(params[:id]).destroy
    flash[:success] = "AllEvent destroyed."
    redirect_to '/edinburgh'
  end


end
