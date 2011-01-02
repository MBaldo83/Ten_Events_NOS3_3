class EventSearcher < ApplicationController

  require 'date'
  require 'nokogiri'
  require 'open-uri'
  require 'chronic'
  
  def perform
  
	find_all_events #in app controller
  
  end

end