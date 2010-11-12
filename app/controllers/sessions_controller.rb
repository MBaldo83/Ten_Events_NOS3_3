class SessionsController < ApplicationController
  
  def new
    
	@title = "Sign in"
	
	respond_to do |format|
      format.html { render 'new'}
      format.xml  { render :xml => @user.to_xml }
      format.json  { render :json => @user.to_json }
	end
	
 end

def create

	if (params[:session]) 
	user = User.authenticate(params[:session][:name], 
							params[:session][:password])
							
	else
	user = User.authenticate(params[:name], 
							params[:password])
	end
	
 respond_to do |format|
   if user.nil?
	  
	  flash.now[:error] = "Invalid name/password combination."
      @title = "Sign in"
      
	  format.html { render 'new' }
	  format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
	  
   else
	
	sign_in user
	
	format.html { redirect_to root_path}
	format.xml  { render :xml => @user, :status => :created, :location => @user }
   end
  end
end


def destroy
    sign_out	
end
  
  def authenticate
	deny_access unless signed_in?
  end

end
