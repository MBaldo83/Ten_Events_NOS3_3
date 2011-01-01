class VenuesController < ApplicationController
 def index
	
	@title = "All Venues"
	@venues = Venue.order('venueName ASC')
	
	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venue }
      format.json { render :json => @venue }
    end	
  end

  def show
  @venue = Venue.find(params[:id])
  
	respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue }
      format.json  { render :json => @venue }
    end
  end

  def edit
     @venue = Venue.find(params[:id])
     @title = "Edit Venue"
  end

 def new
	@venue = Venue.new
	@title = "New Venue"
	
	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue }
      format.json  { render :json => @venue } 
	end
 end
 
   def create
	
    @venue = Venue.new(params[:venue])
	@venue.old_venue_name = @venue.venueName
	
    if @venue.save
	
	  flash[:success] = "New venue created"
      redirect_to venues_path
    else
      @title = "New Venue"
      render 'new'
    end
  end
  
  def update
    @venue = Venue.find(params[:id])
	
	@eventsAtVenue = SuggestedEvent.where(:venue => @venue.venueName)
	
    if @venue.update_attributes_extra(params[:venue])
      flash[:success] = "Venue updated."
      redirect_to @venue
    else
      @title = "Edit venue"
      render 'edit'
  end
	
  end
  
  def destroy
	Venue.find(params[:id]).destroy
    flash[:success] = "Venue deleted"
    redirect_to venues_path
  end
  
 def delete_all_unused_venues
  
  @unused_venues = Venue.where(:city_location => nil)
  
  @unused_venues.each do |uv|
  uv.delete
  end
  
  redirect_to venues_path
  
 end
 
 def order_by_city
 
 @title = "All Venues"
 @venues = Venue.order('city_location ASC')
 
 end

end
