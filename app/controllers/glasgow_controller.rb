class GlasgowController < ApplicationController

before_filter :authenticate

  def index

    @title = "Glasgow"
  
  end
  
  
  def destroy
  
  @title = "destroy glasgow!"
  
  end

end
