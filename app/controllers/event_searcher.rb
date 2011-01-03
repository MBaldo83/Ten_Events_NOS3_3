class EventSearcher < ApplicationController
  
  attr_accessor :all_events
  attr_accessor :one_event_id
  
  def perform
  
  logger.debug"in perform"
  
  if all_events == 1
  
	logger.debug"in perform, all_events == 1"
  
	find_all_events
	
  end
	
  if one_event_id != nil
  
  logger.debug"in perform, one_event != nil"
  logger.debug(one_event_id)
  find_one_band_events(one_event_id)
  
  end
  
  end # Of Perform
  
end #of class