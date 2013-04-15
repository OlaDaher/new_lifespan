class SessionsController < ApplicationController
   skip_authorization_check
    def new
      @title = "Log in"
  	end

  	def create
    	donor = Donor.find_by_email(params[:email])
 		  if donor && donor.authenticate(params[:password])
          session[:donor_id] = donor.id

          if current_donor && current_donor.admin == true
    		    redirect_to root_url, :notice => "Welcome System Admin, LifeSpan+ at your service!"
          else
            redirect_to root_url, :notice => "Welcome #{donor.proper_name}, You're part of the 4% !"
          end
      else
    		flash.now.alert = "Invalid email or password"
    		render "new"
  		end
  	end

  	def destroy
      if session[:donor_id]
        session[:donor_id] = nil
        redirect_to root_url, :notice => "Succesfully Logged out!"
      else
        redirect_to root_url, :notice => "Unauthorized command!" 
      end   
    end
end    
