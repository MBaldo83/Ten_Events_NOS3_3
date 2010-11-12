class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  	def authenticate
      deny_access unless signed_in?
    end

end
