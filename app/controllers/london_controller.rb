class LondonController < ApplicationController

before_filter :authenticate

  def index

    @title = "London"
  
  end
  
  
  def destroy
  
  @title = "destroy london!"
  
  end

end
