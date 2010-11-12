class EdinburghController < ApplicationController

before_filter :authenticate

  def index

    @title = "Edinburgh"
  
  end
  
  
  def destroy
  
  @title = "destroy edinburgh!"
  
  end

end
