class TastesController < ApplicationController

before_filter :authenticate
  
  def index
  
  @all_tastes = Taste.all
  
  end
  
  def destroy
	Taste.find(params[:id]).destroy
    flash[:success] = "Taste destroyed."
    redirect_to '/tastes'
  end

end
