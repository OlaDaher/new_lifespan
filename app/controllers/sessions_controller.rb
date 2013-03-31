class SessionsController < ApplicationController
   #load_and_authorize_resource
   skip_authorization_check
    def new
      @title = "Log in"
  	end

  	def create
    	donor = Donor.find_by_email(params[:email])
 		  if donor && donor.authenticate(params[:password])
    		session[:donor_id] = donor.id
        if donor.admin == true
    		  redirect_to root_url, :notice => "System Admin Logged in!"
        else
          redirect_to root_url, :notice => "#{donor.proper_name} Logged in!"
  		  end
      else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

  	def destroy
    	session[:donor_id] = nil
    	redirect_to root_url, :notice => "Logged out!"
  	end
end
