class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  
  	def authenticate
	logger.debug"changing app controller"
      deny_access unless signed_in?
    end
	

end # of class
