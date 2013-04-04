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
    		  redirect_to root_url, :notice => "Welcome System Admin, You're Signed in!"
      else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

  	def destroy
      cookies.delete(:auth_token)
      if current_donor && current_donor.admin == true
  	    redirect_to root_url, :notice => "System Admin Logged out!"
      else 
        redirect_to root_url, :notice => "You have Logged out!"
      end

      session[:donor_id] = nil
  	redirect_to root_url, :notice => "Donor Logged out!"
  	end
end
