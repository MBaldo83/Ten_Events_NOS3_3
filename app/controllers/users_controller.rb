class UsersController < ApplicationController
  
  before_filter :authenticate
  
  ###pages for viewing / editing users should not exist for final deployment
  
  def new
	@user = User.new
	@title = "New Administrator"
	
	respond_to do |format|
      format.html { render 'new' }
      format.xml  { render :xml => @user }
	end
  
  end
  
  def show
    @user = User.find(params[:id])
	@title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
	
	respond_to do |format|
     if @user.save
	 
	   sign_in @user
	   format.html { redirect_to @user, :flash => { :success => "You're now a Ten Events administrator!" }}
	   format.xml  { render :xml => @user, :status => :created, :location => @user }
     else
      @title = "Sign up"
	  format.html { render 'new' }
	  format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
     end
	end
  end



end
